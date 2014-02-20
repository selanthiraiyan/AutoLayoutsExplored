//
//  StopOrTrailingStopView.m
//  AutoLayoutsExplored
//
//  Created by Sharma Elanthiraiyan on 20/02/14.
//  Copyright (c) 2014 Sharma Elanthiraiyan. All rights reserved.
//

#import "StopOrTrailingStopView.h"

@interface StopOrTrailingStopView ()

@property (strong) UILabel *label1;
@property (strong) UILabel *label2;
@property (strong) UILabel *label3;

@end

@implementation StopOrTrailingStopView
@synthesize label1, label2, label3;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor redColor];

        
        self.label1 = [[UILabel alloc]init];
        self.label1.translatesAutoresizingMaskIntoConstraints = NO;
        self.label1.text = @"test1";
        self.label1.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.label1];
        
        self.label2 = [[UILabel alloc]init];
        self.label2.translatesAutoresizingMaskIntoConstraints = NO;
        self.label2.text = @"test2";
        self.label2.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.label2];
        
        self.label3 = [[UILabel alloc]init];
        self.label3.translatesAutoresizingMaskIntoConstraints = NO;
        self.label3.text = @"test3";
        self.label3.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.label3];
        
        NSDictionary *views = NSDictionaryOfVariableBindings(label1, label2, label3);
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[label1]-[label2]-[label3]-|" options:NSLayoutFormatAlignAllCenterX metrics:0 views:views]];
    }
    return self;
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
