//
//  YKTabBarController.h
//  YKTabBarControllerDemo
//
//  Created by Yoshiki Kurihara on 12/11/21.
//  Copyright (c) 2012年 Yoshiki Kurihara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YKTabBar.h"

#define kYKTabBarControllerSelectedIndexChangedNotification @"kYKTabBarControllerSelectedIndexChangedNotification"
#define kYKTabBarControllerPopToRootNotification @"kYKTabBarControllerPopToRootNotification"

@interface YKTabBarController : UIViewController <YKTabBarDelegate>

@property (nonatomic, strong) NSArray *viewControllers;
@property (nonatomic, strong) YKTabBar *tabBar;
@property (nonatomic, assign) CGFloat tabBarHeight;
@property (nonatomic, assign) CGFloat tabBarTitleLabelFontSize;

- (UIViewController *)selectedViewController;
- (void)switchViewController:(UIViewController *)viewController;
- (UIViewController *)viewControllerAtIndex:(NSInteger)index;
- (NSInteger)selectedIndex;
- (void)setSelectedIndex:(NSInteger)selectedIndex;

@end
