//
//  iPadViewController.m
//  AutoLayoutsExplored
//
//  Created by Sharma Elanthiraiyan on 14/04/14.
//  Copyright (c) 2014 Sharma Elanthiraiyan. All rights reserved.
//

#import "iPadViewController.h"
#import "HomeView.h"

@interface iPadViewController ()

@property (strong) HomeView *homeView;

@end

@implementation iPadViewController
@synthesize homeView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view = [[UIView alloc]init];
        
        self.homeView = [[HomeView alloc]init];
        self.homeView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:self.homeView];
        
        NSDictionary *views = NSDictionaryOfVariableBindings(homeView);
        
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[homeView]|" options:0 metrics:0 views:views]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[homeView]|" options:0 metrics:0 views:views]];

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
