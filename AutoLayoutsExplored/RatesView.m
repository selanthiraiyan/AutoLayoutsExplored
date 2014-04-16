//
//  RatesView.m
//  AutoLayoutsExplored
//
//  Created by Sharma Elanthiraiyan on 14/04/14.
//  Copyright (c) 2014 Sharma Elanthiraiyan. All rights reserved.
//

#import "RatesView.h"

@interface RatesView ()

@property (strong) UILabel *label1;
@property (strong) UILabel *label2;

@end

@implementation RatesView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        
        self.label1 = [[UILabel alloc]init];
        self.label1.backgroundColor = [UIColor blueColor];
        [self addSubview:self.label1];
        
        
        self.label2 = [[UILabel alloc]init];
        self.label2.backgroundColor = [UIColor redColor];
        [self addSubview:self.label2];

        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];

    NSLog(@"Adjust the subviews position here %@", NSStringFromCGRect(self.bounds));

    
    if (UIInterfaceOrientationIsPortrait(orientation))
    {
        self.label1.frame = CGRectMake(self.bounds.origin.x, self.bounds.size.height / 4, self.bounds.size.width * .3, self.bounds.size.height * .2);
        self.label2.frame = CGRectMake(self.bounds.origin.x, self.label1.frame.origin.y + self.label1.frame.size.height, self.bounds.size.width * .3, self.bounds.size.height * .2);
    }
    else
    {
        self.label1.frame = CGRectMake(self.bounds.origin.x, self.bounds.size.height / 4, self.bounds.size.width * .3, self.bounds.size.height * .2);
        self.label2.frame = CGRectMake(self.label1.frame.origin.x + self.label1.frame.size.width, self.bounds.size.height / 4, self.bounds.size.width * .3, self.bounds.size.height * .2);
    }
    

    
    
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
