//
//  VestViewController.m
//  LzVestPackage
//
//  Created by Tom on 2018/1/3.
//  Copyright © 2018年 wanglz. All rights reserved.
//

#import "VestViewController.h"
#import "ZKWebViewController.h"
@interface VestViewController ()<UITabBarControllerDelegate>
@property (nonatomic, strong) ZKWebViewController * webVC;
@end

@implementation VestViewController

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray * viewControllers = [NSMutableArray array];
    self.webVC = [[ZKWebViewController alloc] init];
    [viewControllers addObject:self.webVC];
    NSArray *titleArr  = @[@"首页",@"后退",@"前进",@"刷新",@"退出"];
    NSArray *imgArr = @[@"homePic",@"backPic",@"gotoPic1",@"refreshPic",@"exit"];
    for (int idx = 0; idx<titleArr.count; idx++) {
        UITabBarItem *tabbarItem = [[UITabBarItem alloc] initWithTitle:titleArr[idx] image:[UIImage imageNamed:imgArr[idx]] tag:idx];
        if (idx==0) {
            self.webVC.tabBarItem = tabbarItem;
        }else {
            UIViewController * viewVC = [UIViewController new];
            [viewControllers addObject:viewVC];
            viewVC.tabBarItem = tabbarItem;
        }
    }
    self.viewControllers = viewControllers;
    self.delegate = self;
}

-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    NSInteger tag = [tabBarController.viewControllers indexOfObject:viewController];
    [self tabBarItemWithIndex:tag];
    return NO;
}

- (void)tabBarItemWithIndex:(NSInteger)index {
    if (index==0) { //首页
        [self.webVC goHome];
    }else if (index==1) { //后退
        [self.webVC forward];
    }else if (index==2) { //前进
        [self.webVC back];
    }else if (index==3) { //刷新
        [self.webVC reFresh];
    }else if (index==4) { //退出
        [self.webVC exit];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
