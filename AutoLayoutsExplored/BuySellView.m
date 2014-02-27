//
//  BuySellView.m
//  AutoLayoutsExplored
//
//  Created by Sharma Elanthiraiyan on 20/02/14.
//  Copyright (c) 2014 Sharma Elanthiraiyan. All rights reserved.
//

#import "BuySellView.h"

@interface BuySellView ()

@property (strong) UIButton *button;
@property (strong) UILabel *label1;
@property (strong) UILabel *label2;
@property (strong) UILabel *label3;


@property (strong) NSMutableArray *constraints;

@end

@implementation BuySellView
@synthesize button, label1, label2, label3;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor blueColor];
        
        self.button = [[UIButton alloc]init];
        self.button.backgroundColor = [UIColor redColor];
        self.button.translatesAutoresizingMaskIntoConstraints = NO;
        [self.button addTarget:self action:@selector(adjustViews) forControlEvents:UIControlEventTouchUpInside];
        [self.button setTitle:@"Click me" forState:UIControlStateNormal];
        [self addSubview:self.button];
        
        self.label1 = [[UILabel alloc]init];
        self.label1.translatesAutoresizingMaskIntoConstraints = NO;
        self.label1.textAlignment = NSTextAlignmentCenter;
        self.label1.text = @"label1";
        [self addSubview:self.label1];
        
        self.label2 = [[UILabel alloc]init];
        self.label2.translatesAutoresizingMaskIntoConstraints = NO;
        self.label2.textAlignment = NSTextAlignmentCenter;
        self.label2.text = @"label2";
        [self addSubview:self.label2];
        
        self.label3 = [[UILabel alloc]init];
        self.label3.translatesAutoresizingMaskIntoConstraints = NO;
        self.label3.textAlignment = NSTextAlignmentCenter;
        self.label3.text = @"label3";
        [self addSubview:self.label3];
        
        [self replotContraints];
    }
    return self;
}

- (void)replotContraints
{
    if (self.constraints) {
        [self removeConstraints:self.constraints];
    }
    
    NSDictionary *views = NSDictionaryOfVariableBindings(button, label1, label2);
    
    self.constraints = [NSMutableArray array];
    
    [self.constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[button]-|" options:0 metrics:0 views:views]];
    [self.constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"[label1(==button)]" options:0 metrics:0 views:views]];
    [self.constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"[label2(==button)]" options:0 metrics:0 views:views]];
    
    if ([self.subviews  containsObject:self.label3]) {
        
        views = NSDictionaryOfVariableBindings(button, label1, label2, label3);
        
        [self.constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"[label3(==button)]" options:0 metrics:0 views:views]];
        [self.constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[button(30)]-[label1(==button)]-[label2(==button)]-[label3(==button)]-|" options:NSLayoutFormatAlignAllCenterX metrics:0 views:views]];
    }
    else {
        [self.constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[button(30)]-[label1(==button)]-[label2(==button)]-|" options:NSLayoutFormatAlignAllCenterX metrics:0 views:views]];
    }
    
    [self addConstraints:self.constraints];

}

- (void)adjustViews
{
    if ([self.subviews  containsObject:self.label3]) {
        [self.label3 removeFromSuperview];
    }
    else {
        [self addSubview:self.label3];
    }
    [self replotContraints];
    [self layoutIfNeeded];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
