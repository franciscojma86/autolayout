//
//  UIView+Autolayout.m
//  Portfolio
//
//  Created by Francisco Magdaleno on 1/12/16.
//  Copyright © 2016 franciscojma86. All rights reserved.
//

#import "UIView+Autolayout.h"

@implementation UIView (Autolayout)

#pragma mark -View creation
+ (UIView *)autoLayoutView {
    UIView *view = [[UIView alloc]init];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    return view;
}

#pragma mark -Fill subview
- (NSArray<NSLayoutConstraint *> *)fitSubview:(UIView *)subView {
    NSArray *constraints = [self alignEdges:ConstraintEdgesTop |
                            ConstraintEdgesRight |
                            ConstraintEdgesBottom |
                            ConstraintEdgesLeft
                                      view1:self
                                      view2:subView
                                 multiplier:1.0
                                    padding:0];
    return constraints;
}

- (NSArray<NSLayoutConstraint *> *)fitSubview:(UIView *)subView
                               overallPadding:(CGFloat)overallPadding {
    return [self alignEdges:ConstraintEdgesTop |
            ConstraintEdgesRight |
            ConstraintEdgesBottom |
            ConstraintEdgesLeft
                      view1:self
                      view2:subView
                 multiplier:1.0
                    padding:overallPadding];
}

- (NSArray<NSLayoutConstraint *> *)fitSubview:(UIView *)subView
                               overallPadding:(CGFloat)overallPadding
                                   multiplier:(CGFloat)multiplier {
    return [self alignEdges:ConstraintEdgesTop |
            ConstraintEdgesRight |
            ConstraintEdgesBottom |
            ConstraintEdgesLeft
                      view1:self
                      view2:subView
                 multiplier:multiplier
                    padding:overallPadding];
}

#pragma mark -Dimensions
- (NSArray<NSLayoutConstraint *> *)alignDimensions:(ConstraintDimensions)dimensions
                                             view1:(UIView *)view1
                                             view2:(UIView *)view2 {
    return [self alignDimensions:dimensions
                           view1:view1
                           view2:view2
                      multiplier:1.0
                          offset:0.0];
}

- (NSArray<NSLayoutConstraint *> *)alignDimensions:(ConstraintDimensions)dimensions
                                             view1:(UIView *)view1
                                             view2:(UIView *)view2
                                        multiplier:(CGFloat)multiplier {
    return [self alignDimensions:dimensions
                           view1:view1
                           view2:view2
                      multiplier:multiplier
                          offset:0.0];
}

- (NSArray<NSLayoutConstraint *> *)alignDimensions:(ConstraintDimensions)dimensions
                                             view1:(UIView *)view1
                                             view2:(UIView *)view2
                                        multiplier:(CGFloat)multiplier
                                            offset:(CGFloat)offset {
    NSMutableArray *constraints = [NSMutableArray array];
    if (dimensions & ConstraintDimensionsWidth) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:view1
                                                            attribute:NSLayoutAttributeWidth
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:view2
                                                            attribute:NSLayoutAttributeWidth
                                                           multiplier:multiplier
                                                             constant:offset]];
    }
    if (dimensions & ConstraintDimensionsHeight) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:view1
                                                            attribute:NSLayoutAttributeHeight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:view2
                                                            attribute:NSLayoutAttributeHeight
                                                           multiplier:multiplier
                                                             constant:offset]];
    }
    [self addConstraints:constraints];
    return constraints;
}


- (NSArray<NSLayoutConstraint *> *)changeDimensions:(ConstraintDimensions)dimensions
                                               size:(CGFloat)size {
    NSMutableArray *constraints = [NSMutableArray array];
    if (dimensions & ConstraintDimensionsWidth) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:self
                                                            attribute:NSLayoutAttributeWidth
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:nil
                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                           multiplier:1.0
                                                             constant:size]];
    }
    if (dimensions & ConstraintDimensionsHeight) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:self
                                                            attribute:NSLayoutAttributeHeight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:nil
                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                           multiplier:1.0
                                                             constant:size]];
    }
    [self addConstraints:constraints];
    return constraints;
}

#pragma mark -Align edges
- (NSArray<NSLayoutConstraint *> *)alignEdges:(ConstraintEdges)edges
                                      subView:(UIView *)subview {
    NSArray *constraints = [self alignEdges:edges
                                      view1:self
                                      view2:subview
                                 multiplier:1.0
                                    padding:0.0];
    return constraints;
}

- (NSArray<NSLayoutConstraint *> *)alignEdges:(ConstraintEdges)edges
                                      subView:(UIView *)subview
                                      padding:(CGFloat)padding {
    NSArray *constraints = [self alignEdges:edges
                                      view1:self
                                      view2:subview
                                 multiplier:1.0
                                    padding:padding];
    return constraints;
}

- (NSArray<NSLayoutConstraint *> *)alignEdges:(ConstraintEdges)edges
                                      subView:(UIView *)subview
                                      padding:(CGFloat)padding
                                   multiplier:(CGFloat)multiplier {
    NSArray *constraints = [self alignEdges:edges
                                      view1:self
                                      view2:subview
                                 multiplier:multiplier
                                    padding:padding];
    return constraints;
}

- (NSArray<NSLayoutConstraint *> *)alignEdges:(ConstraintEdges)edges
                                     fromView:(UIView *)view1
                                       toView:(UIView *)view2 {
    NSArray *constraints = [self alignEdges:edges
                                      view1:view1
                                      view2:view2
                                 multiplier:1.0
                                    padding:0.0];
    return constraints;
}

- (NSArray<NSLayoutConstraint *> *)alignEdges:(ConstraintEdges)edges
                                     fromView:(UIView *)view1
                                       toView:(UIView *)view2
                                      padding:(CGFloat)padding {
    NSArray *constraints = [self alignEdges:edges
                                      view1:view1
                                      view2:view2
                                 multiplier:1.0
                                    padding:padding];
    return constraints;
}

- (NSArray<NSLayoutConstraint *> *)alignEdges:(ConstraintEdges)edges
                                     fromView:(UIView *)view1
                                       toView:(UIView *)view2
                                      padding:(CGFloat)padding
                                   multiplier:(CGFloat)multiplier {
    NSArray *constraints = [self alignEdges:edges
                                      view1:view1
                                      view2:view2
                                 multiplier:multiplier
                                    padding:padding];
    return constraints;
}

#pragma mark -Centers
- (NSArray<NSLayoutConstraint *> *)alignCenters:(ConstraintCenters)centers
                                     forSubView:(UIView *)subView {
    return [self alignCenters:centers
                        view1:self
                        view2:subView
                   multiplier:1.0
                       offset:0.0];
}

- (NSArray<NSLayoutConstraint *> *)alignCenters:(ConstraintCenters)centers
                                     forSubView:(UIView *)subView
                                         offset:(CGFloat)offset {
    return [self alignCenters:centers
                        view1:self
                        view2:subView
                   multiplier:1.0
                       offset:offset];
}

- (NSArray<NSLayoutConstraint *> *)alignCenters:(ConstraintCenters)centers
                                     forSubView:(UIView *)subView
                                         offset:(CGFloat)offset
                                     multiplier:(CGFloat)multiplier {
    return [self alignCenters:centers
                        view1:self
                        view2:subView
                   multiplier:multiplier
                       offset:offset];
}

#pragma mark -Position
- (NSArray<NSLayoutConstraint *> *)arrangePosition:(ConstraintPositions)positions
                                              view:(UIView *)view1
                                            toView:(UIView *)view2 {
    return [self arrangePosition:positions
                            view:view1
                          toView:view2
                         padding:0.0];
}

- (NSArray<NSLayoutConstraint *> *)arrangePosition:(ConstraintPositions)positions
                                              view:(UIView *)view1
                                            toView:(UIView *)view2
                                           padding:(CGFloat)padding {
    return [self arrangePosition:positions
                            view:view1
                          toView:view2
                         padding:padding
                      multiplier:1.0];
}
- (NSArray<NSLayoutConstraint *> *)arrangePosition:(ConstraintPositions)positions
                                              view:(UIView *)view1
                                            toView:(UIView *)view2
                                           padding:(CGFloat)padding
                                        multiplier:(CGFloat)multiplier {
    NSMutableArray *constraints = [NSMutableArray array];
    if (positions & ConstraintPositionsBelow) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:view1
                                                            attribute:NSLayoutAttributeTop
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:view2
                                                            attribute:NSLayoutAttributeBottom
                                                           multiplier:multiplier
                                                             constant:padding]];
    }
    if (positions & ConstraintPositionsOnTop) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:view1
                                                            attribute:NSLayoutAttributeBottom
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:view2
                                                            attribute:NSLayoutAttributeTop
                                                           multiplier:multiplier
                                                             constant:padding]];
    }
    if (positions & ConstraintPositionsToLead) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:view1
                                                            attribute:NSLayoutAttributeLeading
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:view2
                                                            attribute:NSLayoutAttributeTrailing
                                                           multiplier:multiplier
                                                             constant:padding]];
    }
    if (positions & ConstraintPositionsToTrail) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:view1
                                                            attribute:NSLayoutAttributeTrailing
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:view2
                                                            attribute:NSLayoutAttributeLeading
                                                           multiplier:multiplier
                                                             constant:padding]];
    }
    [self addConstraints:constraints];
    return constraints;
}

#pragma mark -Generic constraint generation
- (NSArray<NSLayoutConstraint *> *)alignCenters:(ConstraintCenters)centers
                                          view1:(UIView *)view1
                                          view2:(UIView *)view2
                                     multiplier:(CGFloat)multiplier
                                         offset:(CGFloat)offset {
    NSMutableArray *constraints = [NSMutableArray array];
    if (centers & ConstraintCentersX) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:view1
                                                            attribute:NSLayoutAttributeCenterX
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:view2
                                                            attribute:NSLayoutAttributeCenterX
                                                           multiplier:multiplier
                                                             constant:offset]];
    }
    if (centers & ConstraintCentersY) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:view1
                                                            attribute:NSLayoutAttributeCenterY
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:view2
                                                            attribute:NSLayoutAttributeCenterY
                                                           multiplier:multiplier
                                                             constant:offset]];
    }
    [self addConstraints:constraints];
    return constraints;
}

- (NSArray<NSLayoutConstraint *> *)alignEdges:(ConstraintEdges)edges
                                        view1:(UIView *)view1
                                        view2:(UIView *)view2
                                   multiplier:(CGFloat)multiplier
                                      padding:(CGFloat)padding {
    NSMutableArray *constraints = [NSMutableArray array];
    
    if (edges & ConstraintEdgesTop) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:view1
                                                            attribute:NSLayoutAttributeTop
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:view2
                                                            attribute:NSLayoutAttributeTop
                                                           multiplier:multiplier
                                                             constant:-padding]];
    }
    if (edges & ConstraintEdgesBottom) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:view1
                                                            attribute:NSLayoutAttributeBottom
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:view2
                                                            attribute:NSLayoutAttributeBottom
                                                           multiplier:multiplier
                                                             constant:padding]];
    }
    if (edges & ConstraintEdgesRight) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:view1
                                                            attribute:NSLayoutAttributeTrailing
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:view2
                                                            attribute:NSLayoutAttributeTrailing
                                                           multiplier:multiplier
                                                             constant:padding]];
    }
    if (edges & ConstraintEdgesLeft) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:view1
                                                            attribute:NSLayoutAttributeLeading
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:view2
                                                            attribute:NSLayoutAttributeLeading
                                                           multiplier:multiplier
                                                             constant:-padding]];
    }
    if (edges & ConstraintEdgesBaseline) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:view1
                                                            attribute:NSLayoutAttributeBaseline
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:view2
                                                            attribute:NSLayoutAttributeBaseline
                                                           multiplier:multiplier
                                                             constant:padding]];
    }
    [self addConstraints:constraints];
    return constraints;
    
}



@end

