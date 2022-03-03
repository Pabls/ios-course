//
//  LoginViewController.m
//  Aligatter
//
//  Created by Павел Семин on 2/27/22.
//

#import "LoginViewController.h"
#import "ImagesResources.h"

#import "UIView+UIViewAddAnchor.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUi];
}

#pragma mark - UI configuration

- (void)configureUi {

    [super setImage:[UIImage imageNamed:LOGO_IMG_NAME]];
  
    [self configureTextFieldsView];
}

- (void)configureTextFieldsView {
    
    
    //View 1
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor blueColor];
    [view1 addWidthConstraint:200];
    [view1 addHeightConstraint:20];
    
    
    //View 2
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor greenColor];
    [view2 addWidthConstraint:200];
    [view2 addHeightConstraint:20];
    
    //View 3
    UIView *view3 = [[UIView alloc] init];
    view3.backgroundColor = [UIColor magentaColor];
    [view3 addWidthConstraint:200];
    [view3 addHeightConstraint:20];
    
    //Stack View
    UIStackView *stackView = [[UIStackView alloc] init];
    
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.distribution = UIStackViewDistributionEqualSpacing;
    stackView.alignment = UIStackViewAlignmentCenter;
    stackView.spacing = 8;
    
    
    [stackView addArrangedSubview:view1];
    [stackView addArrangedSubview:view2];
    [stackView addArrangedSubview:view3];
    
   
    
    [self.view addSubview:stackView];
    
    [stackView disableTranslatesAutoresizingMaskIntoConstraints];
    //Layout for Stack View
    [stackView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
    [stackView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = true;
}

- (void) configureStackView {
    UIStackView *stackView = [[UIStackView alloc] init];
    
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.distribution = UIStackViewDistributionEqualSpacing;
    stackView.alignment = UIStackViewAlignmentCenter;
    stackView.spacing = 8;
}

@end
