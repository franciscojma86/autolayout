//
//  UIView+Autolayout.h
//  Portfolio
//
//  Created by Francisco Magdaleno on 1/12/16.
//  Copyright © 2016 franciscojma86. All rights reserved.
//


/*
Use this helper class to create NSLayoutConstraint objects and add them to the
superview.
Before calling any if these methods, all the subviews MUST be already added to
their superviews correctly. Once the constraints are created, they will be added
to the caller view, which MUST be the highest view in the heirarchy of the
views involved (superview or above).
*/

#import <UIKit/UIKit.h>

@interface UIView (Autolayout)

typedef NS_OPTIONS(NSUInteger, ConstraintEdges)  {
    ConstraintEdgesTop = (1 << 0),
    ConstraintEdgesLeft = (1 << 1),
    ConstraintEdgesBottom = (1 << 2),
    ConstraintEdgesRight = (1 << 3),
    ConstraintEdgesBaseline = (1 << 4),
    ConstraintEdgesCenterX = (1 << 5),
    ConstraintEdgesCenterY = (1 << 6)
};

typedef NS_OPTIONS(NSUInteger, ConstraintCenters)  {
    ConstraintCentersX = (1 << 0),
    ConstraintCentersY = (1 << 1)
};

typedef NS_OPTIONS(NSUInteger, ConstraintDimensions)  {
    ConstraintDimensionsWidth = (1 << 0),
    ConstraintDimensionsHeight = (1 << 1)
};

typedef NS_OPTIONS(NSUInteger, ConstraintPositions)  {
    ConstraintPositionsOnTop = (1 << 0),
    ConstraintPositionsBelow = (1 << 1),
    ConstraintPositionsToLead = (1 << 2),
    ConstraintPositionsToTrail = (1 << 3)
};

#pragma mark -View creation
///Creates a new UIView ready to be used with Auto Layout
+ (UIView *)autoLayoutView;

#pragma mark - Fill subview
///The given subview will cover the superview completely.
- (NSArray<NSLayoutConstraint *> *)fitSubview:(UIView *)subView;

///The given subview will cover the superview, with a given padding.
- (NSArray<NSLayoutConstraint *> *)fitSubview:(UIView *)subView
                               overallPadding:(CGFloat)overallPadding;

///The given subview will cover the superview, with a given padding and multiplier.
- (NSArray<NSLayoutConstraint *> *)fitSubview:(UIView *)subView
                               overallPadding:(CGFloat)overallPadding
                                   multiplier:(CGFloat)multiplier;

#pragma mark -Edges
///Align the given subview's edges to the superview.
- (NSArray<NSLayoutConstraint *> *)alignEdges:(ConstraintEdges)edges
                                      subView:(UIView *)subview;

///Align the given subview's edges to the superview, with a given padding.
- (NSArray<NSLayoutConstraint *> *)alignEdges:(ConstraintEdges)edges
                                      subView:(UIView *)subview
                                      padding:(CGFloat)padding;

///Align the given subview's edges to the superview, with a given padding and a multiplier,
- (NSArray<NSLayoutConstraint *> *)alignEdges:(ConstraintEdges)edges
                                      subView:(UIView *)subview
                                      padding:(CGFloat)padding
                                   multiplier:(CGFloat)multiplier;

///Align the two given subview's edges to the superview.
- (NSArray<NSLayoutConstraint *> *)alignEdges:(ConstraintEdges)edges
                                     fromView:(UIView *)view1
                                       toView:(UIView *)view2;

///Align the two given subview's edges to the superview with a given padding.
- (NSArray<NSLayoutConstraint *> *)alignEdges:(ConstraintEdges)edges
                                     fromView:(UIView *)view1
                                       toView:(UIView *)view2
                                      padding:(CGFloat)padding;

///Align the two given subview's edges to the superview with a given padding and mulitplier.
- (NSArray<NSLayoutConstraint *> *)alignEdges:(ConstraintEdges)edges
                                     fromView:(UIView *)view1
                                       toView:(UIView *)view2
                                      padding:(CGFloat)padding
                                   multiplier:(CGFloat)multiplier;

#pragma mark -Dimensions
///Give the view a size for width and/or height.
- (NSArray<NSLayoutConstraint *> *)changeDimensions:(ConstraintDimensions)dimensions
                                               size:(CGFloat)size;

///Make the two given subviews the same width and/or height.
- (NSArray<NSLayoutConstraint *> *)alignDimensions:(ConstraintDimensions)dimensions
                                             view1:(UIView *)view1
                                             view2:(UIView *)view2;

///Make the two given subviews the same width and/or height with a multiplier
- (NSArray<NSLayoutConstraint *> *)alignDimensions:(ConstraintDimensions)dimensions
                                             view1:(UIView *)view1
                                             view2:(UIView *)view2
                                        multiplier:(CGFloat)multiplier;

///Make the two given subviews the same width and/or height with a multplier and constant offset.
- (NSArray<NSLayoutConstraint *> *)alignDimensions:(ConstraintDimensions)dimensions
                                             view1:(UIView *)view1
                                             view2:(UIView *)view2
                                        multiplier:(CGFloat)multiplier
                                            offset:(CGFloat)offset;

#pragma mark -Centers
///Align the subview to the superview center y and/or x axis.
- (NSArray<NSLayoutConstraint *> *)alignCenters:(ConstraintCenters)centers
                                     forSubView:(UIView *)subView;

///Align the subview to the superview center y and/or x axis with an offset.
- (NSArray<NSLayoutConstraint *> *)alignCenters:(ConstraintCenters)centers
                                     forSubView:(UIView *)subView
                                         offset:(CGFloat)offset;

///Align the subview to the superview center y and/or x axis with an offset and multiplier.
- (NSArray<NSLayoutConstraint *> *)alignCenters:(ConstraintCenters)centers
                                     forSubView:(UIView *)subView
                                         offset:(CGFloat)offset
                                     multiplier:(CGFloat)multiplier;

///Align the two subviews center y and/or x axis with a multiplier and offset.
- (NSArray<NSLayoutConstraint *> *)alignCenters:(ConstraintCenters)centers
                                          view1:(UIView *)view1
                                          view2:(UIView *)view2
                                     multiplier:(CGFloat)multiplier
                                         offset:(CGFloat)offset;

#pragma mark -Positions
///Position the two subviews in mutual relation.
- (NSArray<NSLayoutConstraint *> *)arrangePosition:(ConstraintPositions)positions
                                              view:(UIView *)view1
                                            toView:(UIView *)view2;

///Position the two subviews in mutual relation with a padding.
- (NSArray<NSLayoutConstraint *> *)arrangePosition:(ConstraintPositions)positions
                                              view:(UIView *)view1
                                            toView:(UIView *)view2
                                           padding:(CGFloat)padding;

///Position the two subviews in mutual relation with a padding and multiplier.
- (NSArray<NSLayoutConstraint *> *)arrangePosition:(ConstraintPositions)positions
                                              view:(UIView *)view1
                                            toView:(UIView *)view2
                                           padding:(CGFloat)padding
                                        multiplier:(CGFloat)multiplier;
@end
