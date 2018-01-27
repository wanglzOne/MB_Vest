//
//  LZWkWebViewController.m
//  httpdns
//
//  Created by lz on 2017/11/24.
//  Copyright © 2017年 iOS. All rights reserved.
//

#import "LZWkWebViewController.h"
#import <WebKit/WebKit.h>
#import <Masonry/Masonry.h>
#import <SVProgressHUD/SVProgressHUD.h>
// 返回YES表示隐藏，返回NO表示显示 状态栏
#define HiddenStatusBar YES
#define webUrl @"http://sda.4399.com/4399swf/upload_swf/ftp19/ssj/20160809/t9/index.html"
#define ADDestimatedProgress  1 //优化web加载时出现的白屏

@interface LZWkWebViewController ()<WKUIDelegate>
@property (nonatomic, strong) WKWebView   * wkWeb;
@property (nonatomic, strong) UIImageView * imageView;
@end

@implementation LZWkWebViewController

- (void)viewWillAppear:(BOOL)animated {
    [self.view addSubview:self.imageView];
    self.imageView.frame = self.view.bounds;
    [UIView animateWithDuration:0.2 animations:^{
        self.imageView.image = [self.imageView.image rotate:UIImageOrientationLeft];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.wkWeb];
    self.wkWeb.frame = self.view.bounds;
    
    if (ADDestimatedProgress == 1) {
        [self.wkWeb addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
        [self.wkWeb setAlpha:0];
        //self.imageView.hidden = YES;
    }
    [_wkWeb loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:webUrl]]];
}

-(BOOL)prefersStatusBarHidden{
    return HiddenStatusBar;// 返回YES表示隐藏，返回NO表示显示
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        if (self.wkWeb.estimatedProgress == 1) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.wkWeb setAlpha:1];
                self.imageView.hidden = YES;
            });
        }
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)dealloc {
    [self.wkWeb removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return UIInterfaceOrientationLandscapeRight;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscapeRight;
}

//必须有
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationLandscapeRight;
}

- (void)webViewDidClose:(WKWebView *)webView {
    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return nil;
}

- (WKWebView *)wkWeb {
    if (!_wkWeb) {
        _wkWeb = [[WKWebView alloc] init];
        _wkWeb.scrollView.scrollEnabled = NO;
    }
    return _wkWeb;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.image = [UIImage imageNamed:@"loginImg"];
        //_imageView.backgroundColor = [UIColor redColor];
    }
    return _imageView;
}

@end
