//
//  iPadBaseView.m
//  AutoLayoutsExplored
//
//  Created by Sharma Elanthiraiyan on 14/04/14.
//  Copyright (c) 2014 Sharma Elanthiraiyan. All rights reserved.
//

#import "iPadBaseView.h"
#import "HeaderView.h"

@interface iPadBaseView ()

@property (strong) HeaderView *headerView;
@property (strong) UIView *contentView;

@end

@implementation iPadBaseView
@synthesize headerView, contentView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.headerView = [[HeaderView alloc]init];
        self.headerView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.headerView];
        
        self.contentView = [[UIView alloc]init];
        self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.contentView];
        
        NSDictionary *views = NSDictionaryOfVariableBindings(headerView, contentView);
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[headerView]|" options:0 metrics:0 views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[contentView(==headerView)]" options:0 metrics:0 views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[headerView(==60)]-[contentView]|" options:0 metrics:0 views:views]];

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
