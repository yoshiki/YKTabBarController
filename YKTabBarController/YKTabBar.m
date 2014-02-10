//
//  YKTabBar.m
//  YKTabBarControllerDemo
//
//  Created by Yoshiki Kurihara on 12/11/21.
//  Copyright (c) 2012年 Yoshiki Kurihara. All rights reserved.
//

#import "YKTabBar.h"

@interface YKTabBar ()

@property (nonatomic, strong) NSMutableArray *countOfTap;

@end

@implementation YKTabBar

@synthesize delegate = _delegate;
@synthesize items = _items;
@synthesize selectedItem = _selectedItem;

- (void)layoutSubviews
{
    CGFloat tabBarWidth = CGRectGetWidth(self.frame);
    CGFloat tabBarItemWidth = tabBarWidth/[_items count];
    for (int i = 0; i < [_items count]; i++) {
        UIButton *button = [self itemAtIndex:i];
        button.frame = CGRectMake(i * tabBarItemWidth, 0.0f, tabBarItemWidth, CGRectGetHeight(self.frame));

        CGFloat spacing = 6.0f;
        CGSize imageSize = button.imageView.frame.size;
        CGSize titleSize = button.titleLabel.frame.size;
        button.titleEdgeInsets = UIEdgeInsetsMake(0.0f, - imageSize.width, - (imageSize.height+spacing), 0.0f);
        titleSize = button.titleLabel.frame.size;
        button.imageEdgeInsets = UIEdgeInsetsMake(spacing, 0.0f, titleSize.height + 3.0f, -titleSize.width);
    }
}

#pragma mark - Public methods

- (void)setItems:(NSArray *)items
{
    [self removeAllItems];

    _items = [[NSArray alloc] initWithArray:items];
    _countOfTap = [NSMutableArray array];
    for (int i = 0; i < [_items count]; i++) {
        UIButton *button = [self itemAtIndex:i];
        [button.titleLabel setFont:[UIFont boldSystemFontOfSize:_titleLabelFontSize]];
        [button.titleLabel setShadowColor:[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.6]];
        [button.titleLabel setShadowOffset:CGSizeMake(0.0f, -1.0f)];
        [button addTarget:self action:@selector(touchDownAction:) forControlEvents:UIControlEventTouchDown];
        [button addTarget:self action:@selector(touchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
        [button addTarget:self action:@selector(otherTouchesAction:) forControlEvents:UIControlEventTouchUpOutside];
        [button addTarget:self action:@selector(otherTouchesAction:) forControlEvents:UIControlEventTouchDragOutside];
        [button addTarget:self action:@selector(otherTouchesAction:) forControlEvents:UIControlEventTouchDragInside];
        [self addSubview:button];
        
        [_countOfTap addObject:[NSNumber numberWithInteger:0]];
    }
}

- (UIButton *)itemAtIndex:(NSInteger)index
{
    return (UIButton *)[_items objectAtIndex:index];
}

- (void)setImage:(UIImage *)image
         atIndex:(NSInteger)index
        forState:(UIControlState)state
{
    UIButton *button = [self itemAtIndex:index];
    [button setImage:image forState:state];
}

- (void)setBackgroundImage:(UIImage *)image
                   atIndex:(NSInteger)index
                  forState:(UIControlState)state
{
    UIButton *button = [self itemAtIndex:index];
    [button setBackgroundImage:image forState:state];
}

- (void)setTitle:(NSString *)title
         atIndex:(NSInteger)index
        forState:(UIControlState)state
{
    UIButton *button = [self itemAtIndex:index];
    [button setTitle:title forState:state];
}

- (void)setTitleColor:(UIColor *)color
              atIndex:(NSInteger)index
             forState:(UIControlState)state
{
    UIButton *button = [self itemAtIndex:index];
    [button setTitleColor:color forState:state];
}

#pragma mark - Private methods

- (NSInteger)countUpTapAtIndex:(NSInteger)index
{
    NSInteger count = [[_countOfTap objectAtIndex:index] integerValue];
    count++;
    [_countOfTap replaceObjectAtIndex:index withObject:[NSNumber numberWithInteger:count]];
    return count;
}

- (void)removeAllItems
{
    for (UIView *view in [self subviews]) {
        [view removeFromSuperview];
    }
    _items = nil;
    _countOfTap = nil;
}

- (void)dimAllButtonsExcept:(UIButton*)selectedButton
{
    for (UIButton* button in _items) {
        if (button == selectedButton) {
            button.selected = YES;
            button.highlighted = button.selected ? NO : YES;
        } else {
            button.selected = NO;
            button.highlighted = NO;

            NSInteger index = [_items indexOfObject:button];
            [_countOfTap replaceObjectAtIndex:index withObject:[NSNumber numberWithInteger:0]];
        }
    }
}

- (void)touchDownAction:(UIButton*)button
{
    [self dimAllButtonsExcept:button];
    if (_delegate != nil && [_delegate respondsToSelector:@selector(touchDownItemAtIndex:)]) {
        _selectedItem = button;
        [_delegate touchDownItemAtIndex:[_items indexOfObject:_selectedItem]];
    }
}

- (void)touchUpInsideAction:(UIButton*)button
{
    [self dimAllButtonsExcept:button];
    
    NSInteger index = [_items indexOfObject:button];
    NSInteger count = [self countUpTapAtIndex:index];
    if (count >= 2) {
        [_delegate tapPlurallyAtIndex:index];
    }
}

- (void)otherTouchesAction:(UIButton*)button
{
    [self dimAllButtonsExcept:button];
}

- (void)setSelectedItem:(UIButton *)selectedItem
{
    _selectedItem = selectedItem;
    [self dimAllButtonsExcept:selectedItem];
}

@end
