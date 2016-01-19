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
    return [self alignView:subView
                    toView:self
                    offset:0.0
                multiplier:1.0
                     edges:ConstraintEdgesTop |
            ConstraintEdgesRight |
            ConstraintEdgesBottom |
            ConstraintEdgesLeft];
}

- (NSArray<NSLayoutConstraint *> *)fitSubview:(UIView *)subView
                               overalloffset:(CGFloat)overalloffset {
    return [self alignView:subView
                    toView:self
                    offset:overalloffset
                multiplier:1.0
                     edges:ConstraintEdgesTop |
            ConstraintEdgesRight |
            ConstraintEdgesBottom |
            ConstraintEdgesLeft];
}

- (NSArray<NSLayoutConstraint *> *)fitSubview:(UIView *)subView
                               overalloffset:(CGFloat)overalloffset
                                   multiplier:(CGFloat)multiplier {
    return [self alignView:subView
                    toView:self
                    offset:overalloffset
                multiplier:multiplier
                     edges:ConstraintEdgesTop |
            ConstraintEdgesRight |
            ConstraintEdgesBottom |
            ConstraintEdgesLeft];
}

#pragma mark -Dimensions
- (NSArray<NSLayoutConstraint *> *)alignView:(UIView *)view1
                                      toView:(UIView *)view2
                                  dimensions:(ConstraintDimensions)dimensions {
    return [self alignView:view1
                    toView:view2
                    offset:0.0
                multiplier:1.0
                dimensions:dimensions];
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

- (NSArray<NSLayoutConstraint *> *)alignView:(UIView *)view1
                                      toView:(UIView *)view2
                                      offset:(CGFloat)offset
                                  multiplier:(CGFloat)multiplier
                                  dimensions:(ConstraintDimensions)dimensions {
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

#pragma mark -Align edges
- (NSArray<NSLayoutConstraint *> *)alignSubview:(UIView *)subview
                                          edges:(ConstraintEdges)edges {
    NSArray *constraints = [self alignView:subview
                                    toView:self
                                    offset:0.0
                                multiplier:1.0
                                     edges:edges];
    return constraints;
}


- (NSArray<NSLayoutConstraint *> *)alignSubview:(UIView *)subview
                                         offset:(CGFloat)offset
                                     multiplier:(CGFloat)multiplier
                                          edges:(ConstraintEdges)edges {
    NSArray *constraints = [self alignView:subview
                                    toView:self
                                    offset:offset
                                multiplier:multiplier
                                     edges:edges];
    return constraints;
}

- (NSArray<NSLayoutConstraint *> *)alignView:(UIView *)view1
                                      toView:(UIView *)view2
                                       edges:(ConstraintEdges)edges {
    NSArray *constraints = [self alignView:view1
                                    toView:view2
                                    offset:0.0
                                multiplier:1.0
                                     edges:edges];
    return constraints;
}

- (NSArray<NSLayoutConstraint *> *)alignView:(UIView *)view1
                                      toView:(UIView *)view2
                                      offset:(CGFloat)offset
                                  multiplier:(CGFloat)multiplier
                                       edges:(ConstraintEdges)edges {
    NSMutableArray *constraints = [NSMutableArray array];
    
    if (edges & ConstraintEdgesTop) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:view1
                                                            attribute:NSLayoutAttributeTop
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:view2
                                                            attribute:NSLayoutAttributeTop
                                                           multiplier:multiplier
                                                             constant:offset]];
    }
    if (edges & ConstraintEdgesBottom) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:view1
                                                            attribute:NSLayoutAttributeBottom
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:view2
                                                            attribute:NSLayoutAttributeBottom
                                                           multiplier:multiplier
                                                             constant:-offset]];
    }
    if (edges & ConstraintEdgesRight) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:view1
                                                            attribute:NSLayoutAttributeTrailing
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:view2
                                                            attribute:NSLayoutAttributeTrailing
                                                           multiplier:multiplier
                                                             constant:-offset]];
    }
    if (edges & ConstraintEdgesLeft) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:view1
                                                            attribute:NSLayoutAttributeLeading
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:view2
                                                            attribute:NSLayoutAttributeLeading
                                                           multiplier:multiplier
                                                             constant:offset]];
    }
    if (edges & ConstraintEdgesBaseline) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:view1
                                                            attribute:NSLayoutAttributeBaseline
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:view2
                                                            attribute:NSLayoutAttributeBaseline
                                                           multiplier:multiplier
                                                             constant:offset]];
    }
    [self addConstraints:constraints];
    return constraints;
    
}


#pragma mark -Centers
- (NSArray<NSLayoutConstraint *> *)alignSubView:(UIView *)subView
                                        centers:(ConstraintCenters)centers {
    return [self alignView:subView
                    toView:self
                    offset:0.0
                multiplier:1.0
                   centers:centers];
}

- (NSArray<NSLayoutConstraint *> *)alignSubView:(UIView *)subView
                                         offset:(CGFloat)offset
                                     multiplier:(CGFloat)multiplier
                                        centers:(ConstraintCenters)centers {
    return [self alignView:subView
                    toView:self
                    offset:offset
                multiplier:multiplier
                   centers:centers];
}

- (NSArray<NSLayoutConstraint *> *)alignView:(UIView *)view1
                                      toView:(UIView *)view2
                                     centers:(ConstraintCenters)centers {
    return [self alignView:view1
                    toView:view2
                    offset:0.0
                multiplier:1.0
                   centers:centers];
}

- (NSArray<NSLayoutConstraint *> *)alignView:(UIView *)view1
                                      toView:(UIView *)view2
                                      offset:(CGFloat)offset
                                  multiplier:(CGFloat)multiplier
                                     centers:(ConstraintCenters)centers {
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

#pragma mark -Position
- (NSArray<NSLayoutConstraint *> *)arrangeView:(UIView *)view1
                                        toView:(UIView *)view2
                                      position:(ConstraintPositions)positions {
    return [self arrangeView:view1
                      toView:view2
                      offset:0.0
                  multiplier:1.0
                    position:positions];
}

- (NSArray<NSLayoutConstraint *> *)arrangeView:(UIView *)view1
                                        toView:(UIView *)view2
                                        offset:(CGFloat)offset
                                    multiplier:(CGFloat)multiplier
                                      position:(ConstraintPositions)positions {
    NSMutableArray *constraints = [NSMutableArray array];
    if (positions & ConstraintPositionsBelow) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:view1
                                                            attribute:NSLayoutAttributeTop
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:view2
                                                            attribute:NSLayoutAttributeBottom
                                                           multiplier:multiplier
                                                             constant:offset]];
    }
    if (positions & ConstraintPositionsOnTop) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:view1
                                                            attribute:NSLayoutAttributeBottom
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:view2
                                                            attribute:NSLayoutAttributeTop
                                                           multiplier:multiplier
                                                             constant:offset]];
    }
    if (positions & ConstraintPositionsToLead) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:view1
                                                            attribute:NSLayoutAttributeLeading
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:view2
                                                            attribute:NSLayoutAttributeTrailing
                                                           multiplier:multiplier
                                                             constant:offset]];
    }
    if (positions & ConstraintPositionsToTrail) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:view1
                                                            attribute:NSLayoutAttributeTrailing
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:view2
                                                            attribute:NSLayoutAttributeLeading
                                                           multiplier:multiplier
                                                             constant:offset]];
    }
    [self addConstraints:constraints];
    return constraints;
}

@end

