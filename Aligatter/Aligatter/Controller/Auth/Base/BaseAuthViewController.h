//
//  BaseAuthViewController.h
//  Aligatter
//
//  Created by Павел Семин on 3/2/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseAuthViewController : UIViewController

@property (strong, nonatomic) UIImageView *logoImage;
@property (strong, nonatomic) UIStackView *textFiledsStackView;
@property (strong, nonatomic) UIStackView *bottomLinkStackView;

- (void)viewDidLoad;
- (void)setImage: (UIImage *) image;
- (void)setTextFieldViews: (NSArray<UIView *> *) views;
- (void)setLinkDescription: (NSString *) description andButtonText:(NSString *) text;
- (UIView *)createTextFieldWithImage:(NSString *) imageName andPlaceholder:(NSString *) placeholder;

#pragma mark - Abstract methods to override
- (void)buttonClicked;
- (void)iconClicked;
@end

NS_ASSUME_NONNULL_END
