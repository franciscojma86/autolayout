//
//  FillViewVC.m
//  AutolayoutDemo
//
//  Created by Francisco Magdaleno on 1/17/16.
//  Copyright © 2016 franciscojma86. All rights reserved.
//

#import "FillViewVC.h"
#import "UIView+Autolayout.h"
@implementation FillViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //First add subviews
    [self.view addSubview:self.blueView];
    
    //Make the view cover the superview with a padding
    [self.view fitSubview:self.blueView overallPadding:30];
    
    //Animate for more visibility
    [UIView animateWithDuration:1 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
