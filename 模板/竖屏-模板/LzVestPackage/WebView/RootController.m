//
//  RootController.m
//  LzVestPackage
//
//  Created by lz on 2017/12/23.
//  Copyright © 2017年 wanglz. All rights reserved.
//

#import "RootController.h"
#define imgName @"loginImg"

@interface RootController ()
@property (nonatomic ,retain)UIImageView * imageView;
@end

@implementation RootController

//必须有
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.view addSubview:self.imageView];
    self.imageView.frame = self.view.bounds;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.image = [UIImage imageNamed:@"loginImg"];
        //_imageView.backgroundColor = [UIColor redColor];
    }
    return _imageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
