//
//  LLNavigationView.m
//  YunDuoZhiXuanGu
//
//  Created by LOLITA0164 on 2019/6/27.
//  Copyright © 2019 LOLITA0164. All rights reserved.
//

#import "LLNavigationView.h"
#import <Masonry/Masonry.h>

@implementation LLNavigationView

-(UIButton *)leftBtn{
    if (_leftBtn==nil) {
        _leftBtn = [self getBtnFont:[UIFont systemFontOfSize:17] action:@selector(leftBtnAction:)];
        [_leftBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [_leftBtn setContentEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
        [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.bottom.equalTo(self);
            make.height.equalTo(@(44));
            make.width.equalTo(@(self.kScreenWidth*1/5));
        }];
    }
    return _leftBtn;
}

-(UIButton *)centerLabel{
    if (_centerLabel==nil) {
        _centerLabel = [self getBtnFont:[UIFont boldSystemFontOfSize:17] action:@selector(centerBtnAction:)];
        [_centerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.bottom.equalTo(self);
            make.height.equalTo(@(44));
            make.width.equalTo(@(self.kScreenWidth*2/3));
        }];
    }
    return _centerLabel;
}

-(UIButton *)rightBtn{
    if (_rightBtn==nil) {
        _rightBtn = [self getBtnFont:[UIFont systemFontOfSize:17] action:@selector(rightBtnAction:)];
        [_rightBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        [_rightBtn setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 5)];
        [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-10);
            make.bottom.equalTo(self);
            make.height.equalTo(@(44));
            make.width.equalTo(@(self.kScreenWidth*1/5));
        }];
    }
    return _rightBtn;
}

-(UIButton*)getBtnFont:(UIFont*)font action:(SEL)action{
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn.titleLabel setFont:font];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor: UIColor.blackColor forState:UIControlStateNormal];
    [self addSubview:btn];
    return btn;
}

-(UIView *)bgView{
    if (_bgView==nil) {
        _bgView = [[UIView alloc] initWithFrame:self.bounds];
        [self insertSubview:_bgView atIndex:0];
        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        _bgView.backgroundColor = UIColor.whiteColor;
    }
    return _bgView;
}



#pragma mark - *************** 设置方法 ***************
-(void)setTitle:(NSString *)title leftBtnImage:(UIImage *)leftImg rightBtnText:(NSString *)right{
    if (title.length) {
        [self.centerLabel setTitle:title forState:UIControlStateNormal];
    }
    if (leftImg) {
        [self.leftBtn setImage:leftImg forState:UIControlStateNormal];
    }
    if (right.length) {
        [self.rightBtn setTitle:right forState:UIControlStateNormal];
    }
}

-(void)setTitle:(NSString *)title rightBtnText:(NSString *)right{
    [self setTitle:title leftBtnImage:self.gobackImage rightBtnText:right];
}


-(void)setTitle:(NSString *)title leftBtnImage:(UIImage *)leftImg rightBtnImage:(UIImage *)rightImg{
    if (title.length) {
        [self.centerLabel setTitle:title forState:UIControlStateNormal];
    }
    if (leftImg) {
        [self.leftBtn setImage:leftImg forState:UIControlStateNormal];
    }
    if (rightImg) {
        [self.rightBtn setImage:rightImg forState:UIControlStateNormal];
    }
}

-(void)setTitle:(NSString *)title rightBtnImage:(UIImage *)rightImg{
    [self setTitle:title leftBtnImage:self.gobackImage rightBtnImage:rightImg];
}

/// 自定义设置中心视图
-(void)setCenterView:(UIView *(^)(void))setup{
    UIView* centerView = setup();
    if (centerView) {
        // 移除旧的中心按钮，添加新视图
        [self.centerLabel removeFromSuperview];
        [self addSubview:centerView];
        [centerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self).offset(self.kStatusBarHeight/2.0);
            make.height.equalTo(centerView.bounds.size.height ? @(centerView.bounds.size.height) : @(44));
            make.width.equalTo(centerView.bounds.size.width ? @(centerView.bounds.size.width) : @(self.kScreenWidth*2/3));
        }];
    }
}

/// 自定义左边视图
-(void)setLeftView:(UIView* (^)(void))setup{
    UIView* leftView = setup();
    if (leftView) {
        // 移除旧的中心按钮，添加新视图
        [self.leftBtn removeFromSuperview];
        [self addSubview:leftView];
        [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.centerY.equalTo(self).offset(self.kStatusBarHeight/2.0);
            make.height.equalTo(leftView.bounds.size.height ? @(leftView.bounds.size.height) : @(44));
            make.width.equalTo(leftView.bounds.size.width ? @(leftView.bounds.size.width) : @(self.kScreenWidth*1/5));
        }];
    }
}

/// 自定义右边视图
-(void)setRightView:(UIView* (^)(void))setup{
    UIView* rightView = setup();
    if (rightView) {
        // 移除旧的中心按钮，添加新视图
        [self.rightBtn removeFromSuperview];
        [self addSubview:rightView];
        [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-10);
            make.centerY.equalTo(self).offset(self.kStatusBarHeight/2.0);
            make.height.equalTo(rightView.bounds.size.height ? @(rightView.bounds.size.height) : @(44));
            make.width.equalTo(rightView.bounds.size.width ? @(rightView.bounds.size.width) : @(self.kScreenWidth*1/5));
        }];
    }
}


/// 设置背景透明
-(void)setTransparent:(BOOL)transparent{
    if (transparent) {
        self.backgroundColor = UIColor.clearColor;
        if (_bgView) { self.bgView.hidden = YES; }
    } else {
        self.backgroundColor = UIColor.whiteColor;
        if (_bgView) { self.bgView.hidden = NO; }
    }
}


#pragma mark - *************** 按钮事件 ***************

-(void)leftBtnAction:(UIButton*)sender{
    if ([self.delegate respondsToSelector:@selector(navigationViewLeftClickEventDelegate)]) {
        [self.delegate navigationViewLeftClickEventDelegate];
    }
}

-(void)centerBtnAction:(UIButton*)sender{
    if ([self.delegate respondsToSelector:@selector(navigationViewCenterClickEventDelegate)]) {
        [self.delegate navigationViewCenterClickEventDelegate];
    }
}

-(void)rightBtnAction:(UIButton*)sender{
    if ([self.delegate respondsToSelector:@selector(navigationViewRightClickEventDelegate)]) {
        [self.delegate navigationViewRightClickEventDelegate];
    }
}



#pragma mark - *************** 其他事件 ***************
/// 屏幕宽度
-(CGFloat)kScreenWidth{
    return UIScreen.mainScreen.bounds.size.width;
}
/// 状态栏高度
-(CGFloat)kStatusBarHeight{
    return UIApplication.sharedApplication.statusBarFrame.size.height;
}
/// 返回图片
-(UIImage*)gobackImage{
    // framework 的 bundle
    NSBundle* bundle = [NSBundle bundleForClass:self.class];
    UIImage* image = [UIImage imageNamed:@"goBack" inBundle:bundle compatibleWithTraitCollection:nil];
    UIImage* templateImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    return templateImage;
}


@end
