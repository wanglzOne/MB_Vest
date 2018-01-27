//
//  CustomNavigationView.m
//  EasyDriver
//
//  Created by  YiDaChuXing on 16/5/4.
//  Copyright © 2016年 EasyTaxi. All rights reserved.
//

#import "CustomNavigationView.h"
#import <Masonry/Masonry.h>

#define CustomNavigationView_BackButton_Width 80



#define CustomNavigationView_StateBar_Height 20

#define CustomNavigationView_Content_Height 44

@implementation CustomNavigationView

//@synthesize titleView = _titleView, leftView = _leftView, rightView = _rightView, titleLabel = _titleLabel, backButton = _backButton;

- (id)initWithSuperView:(UIView *)superView onCusNavButtonTouch_BackButton:(CusNavButtonTouch_BackButton)backButtonBlock
{
    self = [super init];
    if (self) {
        _backButtonBlock = backButtonBlock;
        
        [superView addSubview:self];
        __unsafe_unretained UIView *vi = superView;
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@0);
            make.height.equalTo(@CustomNavigationView_Height);
            make.left.equalTo(@0);
            make.width.equalTo(vi);
        }];
        
        self.backgroundColor = [UIColor redColor];
        
        [self createSubViews];
        
        
        
        
    }
    return self;
}

- (void)createSubViews
{
    int interval = 8.0f;
    //leftView
    _leftView = [[UIView alloc] init];
    _leftView.backgroundColor = [UIColor clearColor];
    [self addSubview:_leftView];
    [_leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.top.equalTo(@CustomNavigationView_StateBar_Height);
        make.width.equalTo(@CustomNavigationView_BackButton_Width);
        make.height.equalTo(@CustomNavigationView_Content_Height);
    }];
//WithFrame:CGRectMake(0, CustomNavigationView_StateBar_Height, NAV_Width/4 -interval, CustomNavigationView_Content_Height)
    
    
    
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backButton addTarget:self action:@selector(_backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_leftView addSubview:_backButton];
    [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(_leftView).insets(UIEdgeInsetsMake(2, 8, 2, 0));
        
    }];
    
    //titleView
    _titleView = [[UIView alloc] init];
    _titleView.backgroundColor = [UIColor clearColor];
    [self addSubview:_titleView];
    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftView.mas_right).offset(interval);
        make.top.equalTo(@CustomNavigationView_StateBar_Height);
        make.right.equalTo(self.mas_right).mas_offset(-interval -CustomNavigationView_BackButton_Width);
        make.height.equalTo(@CustomNavigationView_Content_Height);
    }];
    
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [_titleView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_titleView).insets(UIEdgeInsetsMake(2, 0, 2, 0));
    }];
    
}
- (void)createRightButtonWithTitle:(NSString *)title image:(UIImage *)image
{
    self.rightView = [[UIView alloc] init];
    self.rightView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.rightView];
    [_rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@0);
        make.top.equalTo(@CustomNavigationView_StateBar_Height);
        make.width.equalTo(@CustomNavigationView_BackButton_Width);
        make.height.equalTo(@CustomNavigationView_Content_Height);
    }];
    
    //计算文字 长度  设置一个最长的长度    更新 titleView 的坐标
//    [title sizeOfTextFont:17.0 maxSize:CGSizeMake(0, 0)];
    
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightButton setTitle:title forState:UIControlStateNormal];
    [self.rightButton setImage:image forState:UIControlStateNormal];
    [self.rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.rightView addSubview:self.rightButton];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(_rightView).insets(UIEdgeInsetsMake(2, 0, 2, 8));
        
    }];
    
}






- (void)_backButtonClick:(UIButton *)btn
{
    if (_backButtonBlock) {
        _backButtonBlock(btn);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
