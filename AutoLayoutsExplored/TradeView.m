//
//  TradeView.m
//  AutoLayoutsExplored
//
//  Created by Sharma Elanthiraiyan on 20/02/14.
//  Copyright (c) 2014 Sharma Elanthiraiyan. All rights reserved.
//

#import "TradeView.h"
#import "BuySellView.h"
#import "StopOrTrailingStopView.h"
#import "ProtectionView.h"
#import "ExpiryTypeView.h"

@interface TradeView ()

@property (strong) UIScrollView *scrollView;

@property (strong) BuySellView *buySellView;
@property (strong) StopOrTrailingStopView *stopOrTrailingStopView;
@property (strong) ProtectionView *protectionView;
@property (strong) ExpiryTypeView *expiryTypeView;

@end

@implementation TradeView
@synthesize scrollView, buySellView, stopOrTrailingStopView, protectionView, expiryTypeView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.scrollView = [[UIScrollView alloc]init];
        self.scrollView.backgroundColor = [UIColor greenColor];
        [self addSubview:self.scrollView];
        
        self.buySellView = [[BuySellView alloc]init];
        self.buySellView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.scrollView addSubview:self.buySellView];
        
        self.stopOrTrailingStopView = [[StopOrTrailingStopView alloc]init];
        self.stopOrTrailingStopView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.scrollView addSubview:self.stopOrTrailingStopView];
        
        self.protectionView = [[ProtectionView alloc]init];
        self.protectionView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.scrollView addSubview:self.protectionView];
        
        self.expiryTypeView = [[ExpiryTypeView alloc]init];
        self.expiryTypeView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.scrollView addSubview:self.expiryTypeView];
        
        NSDictionary *views = NSDictionaryOfVariableBindings(scrollView, buySellView, stopOrTrailingStopView, protectionView, expiryTypeView, self);
        
        self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[scrollView]|" options:0 metrics: 0 views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scrollView]|" options:0 metrics: 0 views:views]];
        
        [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[buySellView(==scrollView)]|" options:0 metrics:0 views:views]];
        [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[stopOrTrailingStopView(==buySellView)]" options:0 metrics:0 views:views]];
        [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[protectionView(==buySellView)]" options:0 metrics:0 views:views]];
        [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[expiryTypeView(==buySellView)]" options:0 metrics:0 views:views]];
        [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[buySellView]-[stopOrTrailingStopView]-[protectionView]-[expiryTypeView]|" options:   NSLayoutFormatAlignAllCenterX metrics:0 views:views]];
        
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
