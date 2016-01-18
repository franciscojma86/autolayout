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
    [self.view alignEdges:ConstraintEdgesLeft |
     ConstraintEdgesTop |
     ConstraintEdgesBottom
                  subView:self.redView
                  padding:20];
    [self.view alignEdges:ConstraintEdgesRight |
     ConstraintEdgesTop |
     ConstraintEdgesBottom
                  subView:self.blueView
                  padding:20];
    
    //Blue view leading the red
    [self.view arrangePosition:ConstraintPositionsToLead
                          view:self.blueView
                        toView:self.redView
                       padding:20];
    
    //Same height and width for both views
    [self.view alignDimensions:ConstraintDimensionsWidth
                         view1:self.redView
                         view2:self.blueView
                    multiplier:1.0
                        offset:0.0];


    [UIView animateWithDuration:1 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
