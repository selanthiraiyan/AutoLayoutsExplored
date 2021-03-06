//
//  iPadBaseView.h
//  AutoLayoutsExplored
//
//  Created by Sharma Elanthiraiyan on 14/04/14.
//  Copyright (c) 2014 Sharma Elanthiraiyan. All rights reserved.
//

#import "BaseView.h"
#import "HeaderView.h"

@interface iPadBaseView : BaseView

@property (strong) HeaderView *headerView;
@property (strong) UIView *contentView;

@end
