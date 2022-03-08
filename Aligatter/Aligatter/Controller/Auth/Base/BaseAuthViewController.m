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
        [self.textFiledsStackView  addArrangedSubview:view];
        [view disableTranslatesAutoresizingMaskIntoConstraints];
        [view addLeftConstraint:self.textFiledsStackView.leftAnchor withPadding:0];
        [view addRightConstraint:self.textFiledsStackView.rightAnchor withPadding:0];
        [view addHeightConstraint:50];
    }
}

- (void)setLinkDescription:(NSString *)description andButtonText:(NSString *)text {
    UILabel *label = [[UILabel alloc]init];
    label.text = description;
    label.textColor = [UIColor whiteColor];
    label.font = [label.font fontWithSize:16];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:text forState:UIControlStateNormal];
    button.titleLabel.font = [button.titleLabel.font fontWithSize: 18];
    
    [self.bottomLinkStackView  addArrangedSubview:label];
    [self.bottomLinkStackView  addArrangedSubview:button];
    
    [button addTarget:self action:@selector(bottomButtonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (UIView *)createTextFieldWithImage:(NSString *) imageName andPlaceholder:(NSString *) placeholder andSetSecurityText:(BOOL) isSecureTextEntry {
    UIView *container = [[UIView alloc] init];
    
    // icon
    UIImage *image = [UIImage systemImageNamed:imageName];
    UIImageView *icon = [[UIImageView alloc] initWithImage:image];
    icon.contentMode = UIViewContentModeScaleAspectFit;
    icon.tintColor = [UIColor whiteColor];
    
    // textfiled
    UITextField *textFileld = [[UITextField alloc] init];
    textFileld.placeholder = placeholder;
    textFileld.textColor = [UIColor whiteColor];
    textFileld.tintColor = [UIColor whiteColor];
    textFileld.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    [textFileld setSecureTextEntry:isSecureTextEntry];
    
    // line
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor whiteColor];
    
    [container addSubview:icon];
    [container addSubview:textFileld];
    [container addSubview:line];
    
    // layout
    [icon disableTranslatesAutoresizingMaskIntoConstraints];
    [icon addWidthConstraint:24];
    [icon addHeightConstraint:24];
    [icon addYCenterConstraint:container.centerYAnchor];
    [icon addLeftConstraint:container.leftAnchor withPadding:8];
    
    [textFileld disableTranslatesAutoresizingMaskIntoConstraints];
    [textFileld addLeftConstraint:icon.rightAnchor withPadding:8];
    [textFileld addRightConstraint:container.rightAnchor withPadding:-8];
    [textFileld addYCenterConstraint:container.centerYAnchor];
    
    [line disableTranslatesAutoresizingMaskIntoConstraints];
    [line addBottomConstraint:container.bottomAnchor withPadding:0];
    [line addHeightConstraint:1];
    [line addLeftConstraint:container.leftAnchor withPadding:0];
    [line addRightConstraint:container.rightAnchor withPadding:0];
    
    return container;
}

- (UIButton *)createActionButtonWithTitle:(NSString *)title {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor whiteColor];
    btn.tintColor = [UIColor systemGreenColor];
    btn.layer.cornerRadius = 16;
    
    [btn addTarget:self action:@selector(actionButtonClick) forControlEvents:UIControlEventTouchUpInside];
    return btn;
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
    
    
    UITapGestureRecognizer *rec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(iconClicked)];
    [self.logoImage addGestureRecognizer:rec];
    self.logoImage.userInteractionEnabled = YES;
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
- (void)actionButtonClick {
    // No Action
    // Method for override
}

- (void)bottomButtonClick {
    // No Action
    // Method for override
}

- (void)iconClicked {
    // No Action
    // Method for override
}
@end
