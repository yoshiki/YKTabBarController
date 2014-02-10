//
//  YKTabBarController.m
//  YKTabBarControllerDemo
//
//  Created by Yoshiki Kurihara on 12/11/21.
//  Copyright (c) 2012年 Yoshiki Kurihara. All rights reserved.
//

#import "YKTabBarController.h"

#define kYKTabBarControllerSelectedViewTag 9999

@interface YKTabBarController ()

@end

@implementation YKTabBarController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (_tabBar.selectedItem == nil) {
        _tabBar.selectedItem = [_tabBar.items objectAtIndex:0];
    }
    [self switchViewController:self.selectedViewController];
}

- (void)setViewControllers:(NSArray *)viewControllers
{
    _viewControllers = viewControllers;
    [self loadViewControllers];
    self.view.frame = self.view.bounds;
    [self setupTabBar];
}

- (void)setupTabBar
{
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:[_viewControllers count]];
    for (int i = 0; i < [_viewControllers count]; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [items addObject:button];
    }
    
    _tabBar = [[YKTabBar alloc] initWithFrame:CGRectMake(0.0f,
                                                         CGRectGetHeight(self.view.frame) - self.tabBarHeight,
                                                         CGRectGetWidth(self.view.frame),
                                                         self.tabBarHeight)];
    _tabBar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    _tabBar.titleLabelFontSize = (_tabBarTitleLabelFontSize > 0.0f) ? _tabBarTitleLabelFontSize : kYKTabBarTitleLabelFontSize;
    _tabBar.delegate = self;
    [_tabBar setItems:items];
    [self.view addSubview:_tabBar];
}

- (void)loadViewControllers
{
    for (UIViewController *vc in _viewControllers) {
        [vc view];
        if ([vc isKindOfClass:[UINavigationController class]]) {
            UINavigationController *nav = (UINavigationController *)vc;
            [nav.topViewController view];
        }
    }
}

- (NSInteger)selectedIndex
{
    return [_tabBar.items indexOfObject:_tabBar.selectedItem];
}

- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    if (selectedIndex == self.selectedIndex) return;
    _tabBar.selectedItem = [_tabBar itemAtIndex:selectedIndex];
    [self switchViewController:[self viewControllerAtIndex:self.selectedIndex]];
}

- (UIViewController *)selectedViewController
{
    return [self viewControllerAtIndex:self.selectedIndex];
}

- (void)switchViewController:(UIViewController *)viewController
{
    UIView *currentView = [self.view viewWithTag:kYKTabBarControllerSelectedViewTag];
    if (currentView != nil) {
        currentView.tag = 0;
        [currentView removeFromSuperview];
    }

    if ([[[UIDevice currentDevice] systemVersion] compare:@"5" options:NSNumericSearch] == NSOrderedAscending) {
        for (UIViewController *vc in _viewControllers) {
            if (vc == viewController) continue;
            if ([vc isKindOfClass:[UINavigationController class]]) {
                UINavigationController *nav = (UINavigationController *)vc;
                [nav.topViewController viewWillDisappear:NO];
                [nav.topViewController viewDidDisappear:NO];
            } else {
                [vc viewWillDisappear:NO];
                [vc viewDidDisappear:NO];
            }
        }
    }
    
    viewController.view.frame = [self rectForView];
    viewController.view.tag = kYKTabBarControllerSelectedViewTag;
    [self.view insertSubview:viewController.view belowSubview:_tabBar];

    if ([[[UIDevice currentDevice] systemVersion] compare:@"5" options:NSNumericSearch] == NSOrderedAscending) {
        [viewController viewWillAppear:NO];
        [viewController viewDidAppear:NO];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kYKTabBarControllerSelectedIndexChangedNotification
                                                        object:self];
}

- (UIViewController *)viewControllerAtIndex:(NSInteger)index
{
    return [_viewControllers objectAtIndex:index];
}

- (CGRect)rectForView
{
    return CGRectMake(0.0f,
                      0.0f,
                      CGRectGetWidth(self.view.frame),
                      CGRectGetHeight(self.view.frame) - self.tabBarHeight);
}

- (CGFloat)tabBarHeight
{
    return ((_tabBarHeight > 0) ? _tabBarHeight : kYKTabBarHeight);
}

#pragma mark - YKTabBarDelegate

- (void)touchDownItemAtIndex:(NSInteger)index
{
    UIViewController *viewController = [self viewControllerAtIndex:index];
    [self switchViewController:viewController];
}

- (void)tapPlurallyAtIndex:(NSInteger)index
{
    if (self.selectedViewController != nil) {
        if ([self.selectedViewController isKindOfClass:[UINavigationController class]]
            && [(UINavigationController *)self.selectedViewController viewControllers].count >= 2) {
            [(UINavigationController *)self.selectedViewController popToRootViewControllerAnimated:YES];

            [[NSNotificationCenter defaultCenter] postNotificationName:kYKTabBarControllerPopToRootNotification
                                                                object:self];
        }
    }
}

@end
