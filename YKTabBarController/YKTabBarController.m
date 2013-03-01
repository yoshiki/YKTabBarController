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

@synthesize viewControllers = _viewControllers;
@synthesize tabBar = _tabBar;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.tabBar.selectedItem == nil) {
        self.tabBar.selectedItem = [self.tabBar.items objectAtIndex:0];
    }
    [self switchViewController:self.selectedViewController];
}

- (void)setViewControllers:(NSArray *)viewControllers {
    _viewControllers = viewControllers;
    self.view.frame = self.view.bounds;
    [self setupTabBar];
}

- (void)setupTabBar {
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:[self.viewControllers count]];
    for (int i = 0; i < [self.viewControllers count]; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [items addObject:button];
    }
    
    self.tabBar = [[YKTabBar alloc] initWithFrame:CGRectMake(0.0f,
                                                             CGRectGetHeight(self.view.frame) - kYKTabBarHeight,
                                                             CGRectGetWidth(self.view.frame),
                                                             kYKTabBarHeight)];
    self.tabBar.delegate = self;
    [self.tabBar setItems:items];
    [self.view addSubview:self.tabBar];
}

- (NSInteger)selectedIndex {
    return [self.tabBar.items indexOfObject:self.tabBar.selectedItem];
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    if (selectedIndex == self.selectedIndex) return;
    self.tabBar.selectedItem = [self.tabBar itemAtIndex:selectedIndex];
    [self switchViewController:[self viewControllerAtIndex:self.selectedIndex]];
}

- (UIViewController *)selectedViewController {
    return [self viewControllerAtIndex:self.selectedIndex];
}

- (void)switchViewController:(UIViewController *)viewController {
    UIView *currentView = [self.view viewWithTag:kYKTabBarControllerSelectedViewTag];
    if (currentView != nil) {
        currentView.tag = 0;
        [currentView removeFromSuperview];
    }
    
    viewController.view.frame = [self rectForView];
    viewController.view.tag = kYKTabBarControllerSelectedViewTag;
    [self.view insertSubview:viewController.view belowSubview:self.tabBar];
    [viewController viewWillAppear:NO];
    [viewController viewDidAppear:NO];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kYKTabBarControllerSelectedIndexChangedNotification
                                                        object:self];
}

- (UIViewController *)viewControllerAtIndex:(NSInteger)index {
    return [self.viewControllers objectAtIndex:index];
}

- (CGRect)rectForView {
    return CGRectMake(0.0f,
                      0.0f,
                      CGRectGetWidth(self.view.frame),
                      CGRectGetHeight(self.view.frame) - kYKTabBarHeight);
}

#pragma mark - YKTabBarDelegate

- (void)touchDownItemAtIndex:(NSInteger)index {
    UIViewController *viewController = [self viewControllerAtIndex:index];
    [self switchViewController:viewController];
}

- (void)tapPlurallyAtIndex:(NSInteger)index {
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
