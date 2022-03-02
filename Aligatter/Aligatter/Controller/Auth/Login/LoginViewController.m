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

- (void) configureUi {
    self.view.backgroundColor = [UIColor systemGreenColor];
    [self.navigationController.navigationBar setHidden:YES];
    [self configureLogo];
}

- (void) configureLogo {
    UIImage *image = [UIImage imageNamed: LOGO_IMG_NAME];
    UIImageView *imageView = [[UIImageView alloc] initWithImage: image];
    imageView.layer.backgroundColor = [UIColor whiteColor].CGColor;
    imageView.layer.cornerRadius = imageView.frame.size.width / 2;
    [self.view addSubview:imageView];
    
    [imageView disableTranslatesAutoresizingMaskIntoConstraints];
    [imageView addTopConstraint:self.view.safeAreaLayoutGuide.topAnchor withPadding:0];
    [imageView addXCenterConstraint:self.view.centerXAnchor];
}

@end
