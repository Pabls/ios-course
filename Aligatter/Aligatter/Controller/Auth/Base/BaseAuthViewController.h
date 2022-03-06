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
- (void)setDescription: (NSString *) description andButtonText:(NSString *) text;

#pragma mark - Abstract methods to override
- (void)buttonClicked;
@end

NS_ASSUME_NONNULL_END
