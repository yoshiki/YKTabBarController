//
//  YKTabBar.h
//  YKTabBarControllerDemo
//
//  Created by Yoshiki Kurihara on 12/11/21.
//  Copyright (c) 2012年 Yoshiki Kurihara. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kYKTabBarHeight 49.0f
#define kYKTabBarTitleLabelFontSize 10.0f

@protocol YKTabBarDelegate <NSObject>

- (void)tapPlurallyAtIndex:(NSInteger)index;

@optional
- (void)touchDownItemAtIndex:(NSInteger)index;

@end

@interface YKTabBar : UIView

@property (unsafe_unretained) id<YKTabBarDelegate> delegate;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, assign) UIButton *selectedItem;
@property (nonatomic, assign) CGFloat titleLabelFontSize;

- (UIButton *)itemAtIndex:(NSInteger)index;

- (void)setImage:(UIImage *)image
         atIndex:(NSInteger)index
        forState:(UIControlState)state;

- (void)setBackgroundImage:(UIImage *)image
                   atIndex:(NSInteger)index
                  forState:(UIControlState)state;

- (void)setTitle:(NSString *)title
         atIndex:(NSInteger)index
        forState:(UIControlState)state;

- (void)setTitleColor:(UIColor *)color
              atIndex:(NSInteger)index
             forState:(UIControlState)state;

@end
