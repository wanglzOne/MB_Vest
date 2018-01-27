//
//  ZKWebViewController.m
//  LzVestPackage
//
//  Created by Tom on 2018/1/3.
//  Copyright © 2018年 wanglz. All rights reserved.
//  https://m.hg732a.com/#module/common/action/home

#import "ZKWebViewController.h"
#import <WebKit/WebKit.h>

@interface ZKWebViewController ()<UIWebViewDelegate,WKNavigationDelegate>
@property (nonatomic, strong) UIWebView * webView;
@property (nonatomic, strong) WKWebView * wkwebView;

@end

@implementation ZKWebViewController

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    //    [self loadWeb]; //用webview
    [self loadWKweb]; //用WKwebview
    
}
#pragma mark - loadWeb
- (void)loadWeb{
    
    [self loadWebView];
    
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-LL_TabbarHeight);
    }];
}

- (void)loadWebView {
    NSString * link = [userDefaults objectForKey:linkURLKey];
    NSURL * url = [NSURL URLWithString:link];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}
#pragma mark - loadWKWeb
- (void)loadWKweb{
    [self loadWKWebView];
    
    self.wkwebView.navigationDelegate = self;
    [self.view addSubview:self.wkwebView];
    [self.wkwebView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-LL_TabbarHeight);
    }];
    
}
-(void)loadWKWebView{
    NSString * link = [userDefaults objectForKey:linkURLKey];
    NSURL * url = [NSURL URLWithString:link];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.wkwebView loadRequest:request];
}
#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    if ([navigationAction.request.URL.absoluteString containsString:@"itunes.apple.com"] && [[UIApplication sharedApplication] openURL:navigationAction.request.URL]) {
        [[UIApplication sharedApplication] openURL:navigationAction.request.URL];
        decisionHandler(WKNavigationActionPolicyCancel);
        
    }else if ([navigationAction.request.URL.absoluteString containsString:@"itms-dervices"]){
        [[UIApplication sharedApplication] openURL:navigationAction.request.URL];
        decisionHandler(WKNavigationActionPolicyCancel);
        
    }else{
        [[UIApplication sharedApplication] openURL:navigationAction.request.URL];
        decisionHandler(WKNavigationActionPolicyCancel);
    };
}
- (void) webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    [SVProgressHUD showWithStatus:@"加载中"];
}

- (void) webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    [SVProgressHUD dismiss];
    
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    [SVProgressHUD dismiss];
    
}
#pragma mark - UIWebViewDelegate
//开始加载的时候调用
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [SVProgressHUD showWithStatus:@"加载中"];
}

//加载完成的时候调用
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [SVProgressHUD dismiss];
}

//加载失败
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [SVProgressHUD dismiss];
}

#pragma mark - lazy init
- (UIWebView *)webView {
    if (!_webView) {
        _webView = [UIWebView new];
        _webView.opaque = NO;
        _webView.backgroundColor = [UIColor whiteColor];
        _webView.scalesPageToFit = YES;
    }
    return _webView;
}

- (WKWebView *)wkwebView{
    if (!_wkwebView) {
        _wkwebView = [[WKWebView alloc] init];
        _wkwebView.opaque = NO;
        _wkwebView.backgroundColor = [UIColor whiteColor];
        _wkwebView.scrollView.scrollEnabled = NO;
    }
    return _wkwebView;
}


#pragma mark - Out Action
- (void)goHome{
    //    [self loadWebView];
    [self loadWKWebView];
}

- (void)forward{
    //    [self.webView goForward];
    [self.wkwebView goForward];
}

- (void)back{
    //    [self.webView goBack];
    [self.wkwebView goBack];
}

- (void)reFresh{
    //    [self.webView reload];
//    [self.wkwebView reload];
    [self loadWKWebView];

}

- (void)exit {
    ScottAlertView *alertView = [ScottAlertView alertViewWithTitle:@"退出应用" message:@""];
    [alertView addAction:[ScottAlertAction actionWithTitle:@"取消" style:ScottAlertActionStyleCancel handler:^(ScottAlertAction *action) {
        
    }]];
    [alertView addAction:[ScottAlertAction actionWithTitle:@"确认" style:ScottAlertActionStyleDestructive handler:^(ScottAlertAction *action) {
        [UIView beginAnimations:@"exitApplication" context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationDelegate:self];
        UIWindow *window = [[UIApplication sharedApplication].delegate window];
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:window cache:NO];
        [UIView setAnimationDidStopSelector:@selector(animationFinished:finished:context:)];
        window.bounds = CGRectMake(0, 0, 0, 0);
        [UIView commitAnimations];
    }]];
    
    ScottAlertViewController * alertCon = [ScottAlertViewController alertControllerWithAlertView:alertView preferredStyle:ScottAlertControllerStyleAlert transitionAnimationStyle:ScottAlertTransitionStyleDropDown];
    alertCon.tapBackgroundDismissEnable = YES;
    [self presentViewController:alertCon animated:YES completion:nil];
}

- (void)animationFinished:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    if ([animationID compare:@"exitApplication"] == 0) {
        exit(0);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

