//
//  NavigationViewController.m
//  CoustomTabBar
//
//  Created by 尾灯 on 2017/11/15.
//  Copyright © 2017年 尾灯. All rights reserved.
//

#import "NavigationViewController.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //解决自定义返回按钮后滑动手势失效的问题
    self.interactivePopGestureRecognizer.delegate = nil;
}
+ (void)initialize
{
    UINavigationBar *bar = [UINavigationBar appearance];

    //修改标题字体颜色及大小
    [bar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:[UIColor colorWithRed:25 / 255.0 green:153 / 255.0 blue:24 / 255.0 alpha:1.0]}];
    //[bar setBackgroundImage:[UIImage imageNamed:@"home_nav"] forBarMetrics:0];
    //[bar setBarTintColor:[UIColor orangeColor]];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        //自定义返回按钮图片样式
        UIImage *leftItemImage = [UIImage imageNamed:@"backArrow_left_black"];
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[leftItemImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
        viewController.navigationItem.leftBarButtonItem = leftItem;

        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    //这句super的push要放在后面, 让viewController可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
    //解决iPhone X push页面时 tabBar上移的问题
    CGRect frame = self.tabBarController.tabBar.frame;
    frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;
    self.tabBarController.tabBar.frame = frame;

}

- (void)back
{

    [self popViewControllerAnimated:YES];

}

-(BOOL)shouldAutorotate
{
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
