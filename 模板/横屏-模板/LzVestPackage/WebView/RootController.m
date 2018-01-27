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
    return UIInterfaceOrientationLandscapeRight;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscapeRight;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.view addSubview:self.imageView];
    self.imageView.frame = self.view.bounds;
    [UIView animateWithDuration:0.2 animations:^{
        self.imageView.image = [self.imageView.image rotate:UIImageOrientationLeft];
    }];
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
