//
//  BaseAuthViewController.m
//  Aligatter
//
//  Created by Павел Семин on 3/2/22.
//

#import "BaseAuthViewController.h"
#import "UIView+UIViewAddAnchor.h"
#import "NSArray+Helper.h"

@interface BaseAuthViewController ()

@end

@implementation BaseAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUI];
}

- (void)setImage: (UIImage *) image {
    [self.logoImage setImage:image];
    
    self.logoImage.contentMode = UIViewContentModeScaleAspectFit;
    self.logoImage.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    self.logoImage.layer.cornerRadius = image.size.width / 2;
}

- (void)setTextFieldViews:(NSArray<UIView *> *)views {
    if([views isNullOrEmpty]) {
        return;
    }
    
    for (UIView *view in views) {
        [view disableTranslatesAutoresizingMaskIntoConstraints];
        [view addWidthConstraint:self.view.frame.size.width];
        [view addHeightConstraint:50];
        [self.textFiledsStackView  addArrangedSubview:view];
    }
}

- (void)setDescription:(NSString *)description andButtonText:(NSString *)text {
    UILabel *label = [[UILabel alloc]init];
    label.text = description;
    label.textColor = [UIColor whiteColor];
    label.font = [label.font fontWithSize:16];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:text forState:UIControlStateNormal];
    button.titleLabel.font = [button.titleLabel.font fontWithSize: 18];
    
    [self.bottomLinkStackView  addArrangedSubview:label];
    [self.bottomLinkStackView  addArrangedSubview:button];
    
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - UI configuration private methods

- (void)configureUI {
    self.view.backgroundColor = [UIColor systemGreenColor];
    [self.navigationController.navigationBar setHidden:YES];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [self configureLogo];
    [self configureTextFieldsStackView];
    [self configureLinksStackView];
}

- (void)configureLogo {
    self.logoImage = [[UIImageView alloc] init];
    self.logoImage.layer.backgroundColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:self.logoImage];
    
    [self.logoImage disableTranslatesAutoresizingMaskIntoConstraints];
    [self.logoImage addTopConstraint:self.view.safeAreaLayoutGuide.topAnchor withPadding:16];
    [self.logoImage addXCenterConstraint:self.view.centerXAnchor];
}

- (void)configureTextFieldsStackView {
    
    self.textFiledsStackView = [[UIStackView alloc] init];
    
    self.textFiledsStackView.axis = UILayoutConstraintAxisVertical;
    self.textFiledsStackView.distribution = UIStackViewDistributionEqualSpacing;
    self.textFiledsStackView.alignment = UIStackViewAlignmentCenter;
    self.textFiledsStackView.spacing = 8;
    
    [self.view addSubview:self.textFiledsStackView];
    
    [self.textFiledsStackView disableTranslatesAutoresizingMaskIntoConstraints];
    [self.textFiledsStackView addTopConstraint:self.logoImage.bottomAnchor withPadding:16];
    
    [self.textFiledsStackView addLeftConstraint:self.view.leftAnchor withPadding:16];
    [self.textFiledsStackView addRightConstraint:self.view.rightAnchor withPadding:-16];
}


- (void)configureLinksStackView {
    self.bottomLinkStackView = [[UIStackView alloc] init];
    self.bottomLinkStackView.axis = UILayoutConstraintAxisHorizontal;
    self.bottomLinkStackView.distribution = UIStackViewDistributionEqualSpacing;
    self.bottomLinkStackView.alignment = UIStackViewAlignmentCenter;
    self.bottomLinkStackView.spacing = 8;
    
    [self.view addSubview:self.bottomLinkStackView];
    
    [self.bottomLinkStackView disableTranslatesAutoresizingMaskIntoConstraints];
    [self.bottomLinkStackView addBottomConstraint:self.view.bottomAnchor withPadding:-16];
    [self.bottomLinkStackView addXCenterConstraint:self.view.centerXAnchor];
}

#pragma mark - Abstract methods
- (void)buttonClicked {
    // No Action
    // Method for override
}
@end
