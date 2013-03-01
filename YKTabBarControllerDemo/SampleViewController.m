//
//  SampleViewController.m
//  YKTabBarControllerDemo
//
//  Created by Yoshiki Kurihara on 13/03/01.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import "SampleViewController.h"

@interface SampleViewController ()

@end

@implementation SampleViewController

- (void)loadView {
    [super loadView];
    
    UIButton *showNextVCButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [showNextVCButton setTitle:@"Show Next VC" forState:UIControlStateNormal];
    [showNextVCButton addTarget:self action:@selector(showNextVC:) forControlEvents:UIControlEventTouchUpInside];
    [showNextVCButton sizeToFit];
    [self.view addSubview:showNextVCButton];
}

- (void)showNextVC:(id)sender {
    SampleViewController *c = [[SampleViewController alloc] init];
    [self.navigationController pushViewController:c animated:YES];
}

@end
