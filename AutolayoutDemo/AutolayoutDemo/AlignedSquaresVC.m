//
//  AlignedSquaresVC.m
//  AutolayoutDemo
//
//  Created by Francisco Magdaleno on 1/18/16.
//  Copyright © 2016 franciscojma86. All rights reserved.
//

#import "AlignedSquaresVC.h"
#import "UIView+Autolayout.h"

@interface AlignedSquaresVC ()

@property (nonatomic,strong) NSArray *centerConstraints;
@property (nonatomic,strong) NSArray *leadingConstraints;

@end

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
    self.leadingConstraints = [self.view alignSubview:self.blueView
                                                offset:20
                                            multiplier:1.0
                                                 edges:ConstraintEdgesLeft
                                                 apply:YES];
    //Generate the constraints to align the square center x to the superview
    //but don't apply yet
    self.centerConstraints = [self.view alignSubView:self.blueView
                                             centers:ConstraintCentersX
                                               apply:NO];
    
    [self.view alignSubview:self.blueView
                     offset:20
                 multiplier:1.0
                      edges:ConstraintEdgesTop
                      apply:YES];
    
    //Give the square a width, the height will be calculated with the rest of
    //the squares
    [self.blueView changeDimensions:ConstraintDimensionsWidth
                               size:200
                              apply:YES];
    
    //Postions the squares beneath each other
    [self.view arrangeView:self.redView
                    toView:self.blueView
                    offset:20
                multiplier:1.0
                  position:ConstraintPositionsBelow
                     apply:YES];

    //Align the leading edges
    [self.view alignView:self.redView
                   toView:self.blueView
                    edges:ConstraintEdgesLeft
                   apply:YES];
    
    //Make them same width and height
    [self.view alignView:self.redView
                  toView:self.blueView
              dimensions:ConstraintDimensionsWidth |
     ConstraintDimensionsHeight
                   apply:YES];
    
    //Attach the bottom square to the bottom of the superview
    [self.view alignSubview:self.redView
                     offset:20
                 multiplier:1.0
                      edges:ConstraintEdgesBottom
                      apply:YES];

    //Execute the constraints so it starts in the leading position
    [self.view layoutIfNeeded];
    
    //Remove the leading constraints and add the center constraints
    [self.view removeConstraints:self.leadingConstraints];
    [self.view addConstraints:self.centerConstraints];
    
    //Animate the change of position, moving all squares by just
    //changing the blue square leading constrain
    [UIView animateWithDuration:1
                          delay:1.0
         usingSpringWithDamping:0.8
          initialSpringVelocity:0.0
                        options:0
                     animations:^{
                         [self.view layoutIfNeeded];
                     } completion:nil];
}

@end
