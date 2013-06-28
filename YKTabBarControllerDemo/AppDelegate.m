//
//  AppDelegate.m
//  YKTabBarControllerDemo
//
//  Created by Yoshiki Kurihara on 12/11/21.
//  Copyright (c) 2012年 Yoshiki Kurihara. All rights reserved.
//

#import "AppDelegate.h"
#import "YKTabBarController.h"
#import "SampleViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];

    SampleViewController *c0 = [[SampleViewController alloc] init];
    c0.title = @"Page 0";
    UINavigationController *nav0 = [[UINavigationController alloc] initWithRootViewController:c0];
    
    SampleViewController *c1 = [[SampleViewController alloc] init];
    c1.title = @"Page 1";
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:c1];
    
    SampleViewController *c2 = [[SampleViewController alloc] init];
    c2.title = @"Page 2";
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:c2];
    
    SampleViewController *c3 = [[SampleViewController alloc] init];
    c3.title = @"Page 3";
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:c3];
    
    YKTabBarController *c = [[YKTabBarController alloc] init];
    [c setViewControllers:[NSArray arrayWithObjects:nav0, nav1, nav2, nav3, nil]];
    
    [c.tabBar setImage:[UIImage imageNamed:@"icn_off"] atIndex:0 forState:UIControlStateNormal];
    [c.tabBar setImage:[UIImage imageNamed:@"icn_off"] atIndex:1 forState:UIControlStateNormal];
    [c.tabBar setImage:[UIImage imageNamed:@"icn_off"] atIndex:2 forState:UIControlStateNormal];
    [c.tabBar setImage:[UIImage imageNamed:@"icn_off"] atIndex:3 forState:UIControlStateNormal];

    [c.tabBar setImage:[UIImage imageNamed:@"icn_on"] atIndex:0 forState:UIControlStateSelected];
    [c.tabBar setImage:[UIImage imageNamed:@"icn_on"] atIndex:1 forState:UIControlStateSelected];
    [c.tabBar setImage:[UIImage imageNamed:@"icn_on"] atIndex:2 forState:UIControlStateSelected];
    [c.tabBar setImage:[UIImage imageNamed:@"icn_on"] atIndex:3 forState:UIControlStateSelected];

    [c.tabBar setBackgroundImage:[UIImage imageNamed:@"btn_bg_left"] atIndex:0 forState:UIControlStateNormal];
    [c.tabBar setBackgroundImage:[UIImage imageNamed:@"btn_bg_middle"] atIndex:1 forState:UIControlStateNormal];
    [c.tabBar setBackgroundImage:[UIImage imageNamed:@"btn_bg_middle"] atIndex:2 forState:UIControlStateNormal];
    [c.tabBar setBackgroundImage:[UIImage imageNamed:@"btn_bg_right"] atIndex:3 forState:UIControlStateNormal];

    [c.tabBar setBackgroundImage:[UIImage imageNamed:@"btn_bg_press_left"] atIndex:0 forState:UIControlStateSelected];
    [c.tabBar setBackgroundImage:[UIImage imageNamed:@"btn_bg_press_left"] atIndex:1 forState:UIControlStateSelected];
    [c.tabBar setBackgroundImage:[UIImage imageNamed:@"btn_bg_press_left"] atIndex:2 forState:UIControlStateSelected];
    [c.tabBar setBackgroundImage:[UIImage imageNamed:@"btn_bg_press_right"] atIndex:3 forState:UIControlStateSelected];
    
    [c.tabBar setTitle:@"Tab0" atIndex:0 forState:UIControlStateNormal];
    [c.tabBar setTitle:@"Tab1" atIndex:1 forState:UIControlStateNormal];
    [c.tabBar setTitle:@"Tab2" atIndex:2 forState:UIControlStateNormal];
    [c.tabBar setTitle:@"Tab3" atIndex:3 forState:UIControlStateNormal];
    
    [c.tabBar setTitleColor:UIColorFromRGBA(0xa7a7a7ff) atIndex:0 forState:UIControlStateNormal];
    [c.tabBar setTitleColor:UIColorFromRGBA(0xa7a7a7ff) atIndex:1 forState:UIControlStateNormal];
    [c.tabBar setTitleColor:UIColorFromRGBA(0xa7a7a7ff) atIndex:2 forState:UIControlStateNormal];
    [c.tabBar setTitleColor:UIColorFromRGBA(0xa7a7a7ff) atIndex:3 forState:UIControlStateNormal];

    [c.tabBar setTitleColor:UIColorFromRGBA(0xffbe07ff) atIndex:0 forState:UIControlStateSelected];
    [c.tabBar setTitleColor:UIColorFromRGBA(0xffbe07ff) atIndex:1 forState:UIControlStateSelected];
    [c.tabBar setTitleColor:UIColorFromRGBA(0xffbe07ff) atIndex:2 forState:UIControlStateSelected];
    [c.tabBar setTitleColor:UIColorFromRGBA(0xffbe07ff) atIndex:3 forState:UIControlStateSelected];

    [c.tabBar setSelectedItem:[c.tabBar itemAtIndex:0]];
    
    self.window.rootViewController = c;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
