//
//  TabBarViewController.m
//  CoustomTabBar
//
//  Created by 尾灯 on 2017/11/15.
//  Copyright © 2017年 尾灯. All rights reserved.
//

#import "TabBarViewController.h"

#import "NavigationViewController.h"

//
//#import "ReserveViewController.h"
//#import "SceneViewController.h"
//#import "QuickparkViewController.h"
//#import "ShoppingViewController.h"
//#import "MyViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

+(void)initialize
{
    //设置未选中的TabBarItem的字体颜色、大小
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    //设置选中了的TabBarItem的字体颜色、大小
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:25 / 255.0 green:153 / 255.0 blue:24 / 255.0 alpha:1.0];

    UITabBarItem *item = [UITabBarItem appearance];

    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];

}

- (void)viewDidLoad {
    [super viewDidLoad];

    //tabBar背景
    UIView *TabBarView = [[UIView alloc]initWithFrame:self.tabBar.bounds];
    TabBarView.backgroundColor = [UIColor whiteColor];
    [self.tabBar addSubview:TabBarView];

    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, 20)];
    imageV.image = [UIImage imageNamed:@"tabBarLine"];
    imageV.contentMode = UIViewContentModeCenter;
    [self.tabBar addSubview:imageV];

    //中间自定义按钮
    UIButton *quickparkBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2 - 30, 49 - 60, 60, 60)];
    quickparkBtn.userInteractionEnabled = NO;
    quickparkBtn.backgroundColor = [UIColor clearColor];
    quickparkBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    quickparkBtn.imageEdgeInsets = UIEdgeInsetsMake(-20, 0, 0, 0);
    [quickparkBtn setImage:[UIImage imageNamed:@"quickpark"] forState:UIControlStateNormal];
    [self.tabBar addSubview:quickparkBtn];
    
    [self setUpAllChildVc];
}

/**
 *  添加所有的控制器
 */
- (void)setUpAllChildVc
{
//    [self setupChildVc:[[ReserveViewController alloc] init] title:@"预定" image:@"reserve" selectedImage:@"reserve_selected"];
//
//    [self setupChildVc:[[SceneViewController alloc] init] title:@"景区" image:@"scene" selectedImage:@"scene_selected"];
//
//    [self setupChildVc:[[QuickparkViewController alloc] init] title:@" " image:nil selectedImage:nil];
//
//    [self setupChildVc:[[ShoppingViewController alloc] init] title:@"购物" image:@"shop" selectedImage:@"shop_selected"];
//
//    [self setupChildVc:[[MyViewController alloc] init] title:@"我的" image:@"my" selectedImage:@"my_selected"];
}

/**
 * 初始化子控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置文字和图片
    vc.navigationItem.title = title;
    vc.title = title;
    if (image || selectedImage) {
        vc.tabBarItem.image = [UIImage imageNamed:image];
        UIImage *selectImage = [UIImage imageNamed:selectedImage];
        vc.tabBarItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }


    NavigationViewController *nav = [[NavigationViewController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
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
