//
//  UIView+UIViewAddAnchor.h
//  Aligatter
//
//  Created by Павел Семин on 2/26/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (UIViewAddAnchor)
- (void) disableTranslatesAutoresizingMaskIntoConstraints;
- (void) addTopConstraint:(nullable NSLayoutYAxisAnchor *) top withPadding:(CGFloat) padding;
- (void) addLeftConstraint:(nullable NSLayoutXAxisAnchor *) left withPadding:(CGFloat) padding;
- (void) addBottomConstraint:(nullable NSLayoutYAxisAnchor *) bottom withPadding:(CGFloat) padding;
- (void) addRightConstraint:(nullable NSLayoutXAxisAnchor *) right withPadding:(CGFloat) padding;
- (void) addWidthConstraint:(CGFloat) width;
- (void) addHeightConstraint:(CGFloat) height;
- (void) addXCenterConstraint:(NSLayoutXAxisAnchor *)anchor;
@end

NS_ASSUME_NONNULL_END
