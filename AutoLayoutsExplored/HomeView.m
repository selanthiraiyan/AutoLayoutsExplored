//
//  HomeView.m
//  AutoLayoutsExplored
//
//  Created by Sharma Elanthiraiyan on 14/04/14.
//  Copyright (c) 2014 Sharma Elanthiraiyan. All rights reserved.
//

#import "HomeView.h"
#import "RatesView.h"
#import "ChartsView.h"
#import "PositionsView.h"

@interface HomeView ()

@property (strong) RatesView *ratesView;
@property (strong) ChartsView *chartsView;
@property (strong) PositionsView *positionsView;

@property (strong) NSMutableArray *localConstraints;

@end

@implementation HomeView
@synthesize ratesView, chartsView, positionsView;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.ratesView = [[RatesView alloc]init];
        self.ratesView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:self.ratesView];
        
        self.chartsView = [[ChartsView alloc]init];
        self.chartsView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:self.chartsView];
        
        self.positionsView = [[PositionsView alloc]init];
        self.positionsView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:self.positionsView];
        
        self.localConstraints = [NSMutableArray array];
        
        
    }
    return self;
}

- (void)setNeedsUpdateConstraints
{

    [super setNeedsUpdateConstraints];
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    

    NSMutableDictionary *views = [NSMutableDictionary dictionaryWithDictionary: NSDictionaryOfVariableBindings(ratesView, chartsView, positionsView)];

    [views setObject:self.contentView forKey:@"contentView"];
    
    [self removeConstraints:self.localConstraints];

    [self.localConstraints removeAllObjects];
    
    if (UIInterfaceOrientationIsPortrait(orientation))
    {
        [self.localConstraints addObject:[NSLayoutConstraint constraintWithItem:self.ratesView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0]];

        [self.localConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[ratesView]|" options:0 metrics:0 views:views]];

        [self.localConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"|[ratesView]-[chartsView]|" options:0 metrics:0 views:views]];
        
        [self.localConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"|[ratesView]-[positionsView]|" options:0 metrics:0 views:views]];
        
        [self.localConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[chartsView]-[positionsView]|" options:0 metrics:0 views:views]];
        
        [self.localConstraints addObject:[NSLayoutConstraint constraintWithItem:self.chartsView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.contentView attribute:NSLayoutAttributeHeight multiplier:0.5 constant:0]];
        
        [self.localConstraints addObject:[NSLayoutConstraint constraintWithItem:self.positionsView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.contentView attribute:NSLayoutAttributeHeight multiplier:0.5 constant:0]];
        
    }
    else
    {
        [self.localConstraints addObject:[NSLayoutConstraint constraintWithItem:self.ratesView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeWidth multiplier:0.3 constant:0]];
        
        [self.localConstraints addObject:[NSLayoutConstraint constraintWithItem:self.ratesView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeHeight multiplier:0.6 constant:0]];

        [self.localConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[ratesView]" options:0 metrics:0 views:views]];

        [self.localConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[chartsView]" options:0 metrics:0 views:views]];

        [self.localConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"|[ratesView]-[chartsView]|" options:0 metrics:0 views:views]];
        
        [self.localConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"|[positionsView]|" options:0 metrics:0 views:views]];
        
        [self.localConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[ratesView][positionsView]|" options:0 metrics:0 views:views]];

        [self.localConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[chartsView][positionsView]|" options:0 metrics:0 views:views]];

        [self.localConstraints addObject:[NSLayoutConstraint constraintWithItem:self.chartsView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.ratesView attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];
        
    }

    
    [self addConstraints:self.localConstraints];
    [self updateConstraints];
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
