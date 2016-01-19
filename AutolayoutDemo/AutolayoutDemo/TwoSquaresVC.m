//
//  AutoLayoutVC.m
//  Portfolio
//
//  Created by Francisco Magdaleno on 1/12/16.
//  Copyright © 2016 franciscojma86. All rights reserved.
//

#import "TwoSquaresVC.h"
#import "UIView+Autolayout.h"


@implementation TwoSquaresVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Add views first
    [self.view addSubview:self.blueView];
    [self.view addSubview:self.redView];
    
    //Top, and sides edges aligned to super view
    [self.view alignSubview:self.redView
                     offset:20
                 multiplier:1.0
                      edges:ConstraintEdgesTop |
     ConstraintEdgesBottom |
     ConstraintEdgesLeft
                      apply:YES];
    
    [self.view alignSubview:self.blueView
                     offset:20
                 multiplier:1.0
                      edges:ConstraintEdgesTop |
     ConstraintEdgesRight |
     ConstraintEdgesBottom
                      apply:YES];
    
    //Blue view leading the red
    [self.view arrangeView:self.blueView
                    toView:self.redView
                    offset:20
                multiplier:1.0 position:ConstraintPositionsToLead
                     apply:YES];
    
    //Same height and width for both views
    [self.view alignView:self.blueView
                  toView:self.redView
              dimensions:ConstraintDimensionsWidth
                   apply:YES];


    [UIView animateWithDuration:1 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
