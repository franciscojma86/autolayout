//
//  AlignedSquaresVC.m
//  AutolayoutDemo
//
//  Created by Francisco Magdaleno on 1/18/16.
//  Copyright © 2016 franciscojma86. All rights reserved.
//

#import "AlignedSquaresVC.h"
#import "UIView+Autolayout.h"

@implementation AlignedSquaresVC


- (void)viewDidLoad {
    [super viewDidLoad];

    //First add the views
    [self.view addSubview:self.blueView];
    [self.view addSubview:self.blackView];
    [self.view addSubview:self.redView];
    
    //Align the top most view to the top, and leading edges of the superview
    //Do it separately so we can keep a reference to the leading constraint,
    //and we can adjust it later
    NSLayoutConstraint *leading = [[self.view alignSubview:self.blueView
                                                    offset:20
                                                multiplier:1.0
                                                     edges:ConstraintEdgesLeft]lastObject];
    [self.view alignSubview:self.blueView
                     offset:20
                 multiplier:1.0 edges:ConstraintEdgesTop];
    
    //Give the square a width, the height will be calculated with the rest of
    //the squares
    [self.blueView changeDimensions:ConstraintDimensionsWidth
                               size:200];
    
    //Postions the squares beneath each other
    [self.view arrangeView:self.redView
                    toView:self.blueView
                    offset:20
                multiplier:1.0
                  position:ConstraintPositionsBelow];

    //Align the leading edges
    [self.view alignView:self.redView
                   toView:self.blueView
                    edges:ConstraintEdgesLeft];
    
    //Make them same width and height
    [self.view alignView:self.redView
                  toView:self.blueView
              dimensions:ConstraintDimensionsWidth | ConstraintDimensionsHeight];
    
    //Attach the bottom square to the bottom of the superview
    [self.view alignSubview:self.redView
                     offset:20
                 multiplier:1.0
                      edges:ConstraintEdgesBottom];
    [self.view layoutIfNeeded];
    
    //Animate the change of position, moving all squares by just
    //changing the blue square leading constrain
    [UIView animateWithDuration:1
                          delay:1.0
         usingSpringWithDamping:0.8
          initialSpringVelocity:0.0
                        options:0
                     animations:^{
                         leading.constant = 100;
                         [self.view layoutIfNeeded];
                     } completion:nil];
}

@end
