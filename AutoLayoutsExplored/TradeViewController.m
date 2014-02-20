//
//  TradeViewController.m
//  AutoLayoutsExplored
//
//  Created by Sharma Elanthiraiyan on 20/02/14.
//  Copyright (c) 2014 Sharma Elanthiraiyan. All rights reserved.
//

#import "TradeViewController.h"
#import "TradeView.h"

@interface TradeViewController ()

@property (strong) TradeView *tradeView;

@end

@implementation TradeViewController
@synthesize tradeView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view = [[UIView alloc]init];
        
        self.tradeView = [[TradeView alloc]init];
        self.tradeView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:self.tradeView];
        
        NSDictionary *views = NSDictionaryOfVariableBindings(tradeView);
        
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[tradeView]|" options:0 metrics:0 views:views]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tradeView]|" options:0 metrics:0 views:views]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
