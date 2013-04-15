#import "JRCenteringScrollView.h"

@interface JRCenteringScrollView ()
@property(retain, nonatomic)  UIView  *containerAtLeastAsLargeAsScrollView;
@end

@implementation JRCenteringScrollView

- (void)setCenteredView:(UIView*)view {
    if (!self.containerAtLeastAsLargeAsScrollView) {
        self.containerAtLeastAsLargeAsScrollView = [[UIView alloc] initWithFrame:CGRectZero];
        [self addSubview:self.containerAtLeastAsLargeAsScrollView];
        self.containerAtLeastAsLargeAsScrollView.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self.containerAtLeastAsLargeAsScrollView.superview addConstraints:@[
         [NSLayoutConstraint constraintWithItem:self.containerAtLeastAsLargeAsScrollView
                                      attribute:NSLayoutAttributeTop
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:self.containerAtLeastAsLargeAsScrollView.superview
                                      attribute:NSLayoutAttributeTop
                                     multiplier:1.0
                                       constant:0.0],
         [NSLayoutConstraint constraintWithItem:self.containerAtLeastAsLargeAsScrollView
                                      attribute:NSLayoutAttributeLeft
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:self.containerAtLeastAsLargeAsScrollView.superview
                                      attribute:NSLayoutAttributeLeft
                                     multiplier:1.0
                                       constant:0.0],
         
         [NSLayoutConstraint constraintWithItem:self.containerAtLeastAsLargeAsScrollView
                                      attribute:NSLayoutAttributeWidth
                                      relatedBy:NSLayoutRelationGreaterThanOrEqual
                                         toItem:self.containerAtLeastAsLargeAsScrollView.superview
                                      attribute:NSLayoutAttributeWidth
                                     multiplier:1.0
                                       constant:0.0],
         [NSLayoutConstraint constraintWithItem:self.containerAtLeastAsLargeAsScrollView
                                      attribute:NSLayoutAttributeHeight
                                      relatedBy:NSLayoutRelationGreaterThanOrEqual
                                         toItem:self.containerAtLeastAsLargeAsScrollView.superview
                                      attribute:NSLayoutAttributeHeight
                                     multiplier:1.0
                                       constant:0.0],
         
         [NSLayoutConstraint constraintWithItem:self.containerAtLeastAsLargeAsScrollView
                                      attribute:NSLayoutAttributeBottom
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:self.containerAtLeastAsLargeAsScrollView.superview
                                      attribute:NSLayoutAttributeBottom
                                     multiplier:1.0
                                       constant:0.0],
         [NSLayoutConstraint constraintWithItem:self.containerAtLeastAsLargeAsScrollView
                                      attribute:NSLayoutAttributeRight
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:self.containerAtLeastAsLargeAsScrollView.superview
                                      attribute:NSLayoutAttributeRight
                                     multiplier:1.0
                                       constant:0.0],
         
         ]];
    }
    
    if (_centeredView) {
        NSMutableArray *constraintsToRemove = [NSMutableArray new];
        for (NSLayoutConstraint *constraint in self.containerAtLeastAsLargeAsScrollView.constraints) {
            if (constraint.firstItem == _centeredView) {
                [constraintsToRemove addObject:constraint];
            }
        }
        for (NSLayoutConstraint *constraint in constraintsToRemove) {
            [self.containerAtLeastAsLargeAsScrollView removeConstraint:constraint];
        }
    }
    
    _centeredView = view;
    
    if (view) {
        [self.containerAtLeastAsLargeAsScrollView addSubview:view];
        [self addConstraints:@[
         [NSLayoutConstraint constraintWithItem:view.superview
                                      attribute:NSLayoutAttributeWidth
                                      relatedBy:NSLayoutRelationGreaterThanOrEqual
                                         toItem:view
                                      attribute:NSLayoutAttributeWidth
                                     multiplier:1.0
                                       constant:0.0],
         [NSLayoutConstraint constraintWithItem:view.superview
                                      attribute:NSLayoutAttributeHeight
                                      relatedBy:NSLayoutRelationGreaterThanOrEqual
                                         toItem:view
                                      attribute:NSLayoutAttributeHeight
                                     multiplier:1.0
                                       constant:0.0],
         
         [NSLayoutConstraint constraintWithItem:view
                                      attribute:NSLayoutAttributeCenterX
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:view.superview
                                      attribute:NSLayoutAttributeCenterX
                                     multiplier:1.0
                                       constant:0.0],
         [NSLayoutConstraint constraintWithItem:view
                                      attribute:NSLayoutAttributeCenterY
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:view.superview
                                      attribute:NSLayoutAttributeCenterY
                                     multiplier:1.0
                                       constant:0.0],
         
         ]];
    }
}

@end