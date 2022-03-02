//
//  UIView+UIViewAddAnchor.m
//  Aligatter
//
//  Created by Павел Семин on 2/26/22.
//

#import "UIView+UIViewAddAnchor.h"

@implementation UIView (UIViewAddAnchor)

- (void) disableTranslatesAutoresizingMaskIntoConstraints {
    self.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)addTopConstraint:(NSLayoutYAxisAnchor *)top withPadding:(CGFloat)padding {
    [self.topAnchor constraintEqualToAnchor:top constant:padding].active = YES;
}

- (void)addLeftConstraint:(id)left withPadding:(CGFloat)padding {
    [self.leftAnchor constraintEqualToAnchor:left constant:padding].active = YES;
}

- (void)addBottomConstraint:(NSLayoutYAxisAnchor *)bottom withPadding:(CGFloat)padding {
    [self.bottomAnchor constraintEqualToAnchor:bottom constant:padding].active = YES;
}

- (void)addRightConstraint:(NSLayoutXAxisAnchor *)right withPadding:(CGFloat)padding {
    [self.rightAnchor constraintEqualToAnchor:right constant:padding].active = YES;
}

- (void)addWidthConstraint:(CGFloat)width {
    [self.widthAnchor constraintEqualToConstant:width].active = YES;
}

- (void)addHeightConstraint:(CGFloat)height {
    [self.heightAnchor constraintEqualToConstant:height].active = YES;
}

- (void) addXCenterConstraint:(NSLayoutXAxisAnchor *)anchor {
    [self.centerXAnchor constraintEqualToAnchor:anchor].active = true;
}
@end
