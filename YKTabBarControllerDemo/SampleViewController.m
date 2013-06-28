//
//  SampleViewController.m
//  YKTabBarControllerDemo
//
//  Created by Yoshiki Kurihara on 13/03/01.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import "SampleViewController.h"

@interface SampleViewController ()

@property (strong, nonatomic) UIButton *showNextVCButton;

@end

@implementation SampleViewController

- (void)loadView {
    [super loadView];
    
    _showNextVCButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_showNextVCButton setTitle:@"Show Next VC" forState:UIControlStateNormal];
    [_showNextVCButton addTarget:self action:@selector(showNextVC:) forControlEvents:UIControlEventTouchUpInside];
    [_showNextVCButton sizeToFit];
    [self.view addSubview:_showNextVCButton];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    CGRect frame = _showNextVCButton.frame;
    frame.origin.x = floorf(CGRectGetWidth(self.view.frame)/2 - CGRectGetWidth(_showNextVCButton.frame)/2);
    frame.origin.y = floorf(CGRectGetHeight(self.view.frame)/2 - CGRectGetHeight(_showNextVCButton.frame)/2);
    _showNextVCButton.frame = frame;
}

- (void)showNextVC:(id)sender {
    SampleViewController *c = [[SampleViewController alloc] init];
    [self.navigationController pushViewController:c animated:YES];
}

@end
