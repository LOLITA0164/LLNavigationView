//
//  LLNavigationView.h
//  YunDuoZhiXuanGu
//
//  Created by LOLITA0164 on 2019/6/27.
//  Copyright © 2019 LOLITA0164. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  LLNavigationViewDlegate <NSObject>
@optional
/**
 左边操作事件
 */
-(void)navigationViewLeftClickEventDelegate;
/**
 中间操作事件
 */
-(void)navigationViewCenterClickEventDelegate;
/**
 右边操作事件
 */
-(void)navigationViewRightClickEventDelegate;
@end



@interface LLNavigationView : UIView

@property (strong, nonatomic) UIButton* leftBtn;        // 左边按钮
@property (strong, nonatomic) UIButton* centerLabel;    // 中间视图
@property (strong, nonatomic) UIButton* rightBtn;       // 右边视图
@property (strong, nonatomic) UIView* bgView;           // 背景视图

@property(nonatomic,weak)id <LLNavigationViewDlegate> delegate;

/// 设置导航
/// @param title 标题
/// @param leftImg 左边图片
/// @param rightImg 右边图片
-(void)setTitle:(NSString*)title leftBtnImage:(UIImage*)leftImg rightBtnImage:(UIImage *)rightImg;

/// 默认右边为返回图标
-(void)setTitle:(NSString*)title rightBtnImage:(UIImage *)rightImg;

/// 设置导航
/// @param title 标题
/// @param leftImg 左边图片
/// @param right 右边标题
-(void)setTitle:(NSString*)title leftBtnImage:(UIImage*)leftImg rightBtnText:(NSString *)right;

/// 默认右边为返回图标
-(void)setTitle:(NSString*)title rightBtnText:(NSString *)right;

/// 自定义设置中心视图
-(void)setCenterView:(UIView* (^)(void))setup;

/// 自定义左边视图
-(void)setLeftView:(UIView* (^)(void))setup;

/// 自定义右边视图
-(void)setRightView:(UIView* (^)(void))setup;

/// 设置背景透明
-(void)setTransparent:(BOOL)transparent;


@end



