//
//  LoginViewController.m
//  Aligatter
//
//  Created by Павел Семин on 2/27/22.
//

#import "LoginViewController.h"
#import "ImagesResources.h"
#import "StringsResources.h"
#import "RegistrationViewController.h"

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
    UIView *v1 = [self createTextFieldWithImage:ENVELOPE_IMG_NAME andHint:EMAIL];
    UIView *v2 = [self createTextFieldWithImage:LOCK_IMG_NAME andHint:PASSWORD];
    UIView *v3 = [[UIView alloc] init];
    [super setTextFieldViews:[[NSArray alloc] initWithObjects:v1, v2, v3, nil]];
    
    [super setDescription:DONT_HAVE_ACCOUNT andButtonText:SIGN_UP];
}

- (UIView *)createTextFieldWithImage:(NSString *) imageName andHint:(NSString *) hint {
    UIView *container = [[UIView alloc] init];
    
    // icon
    UIImage *image = [UIImage systemImageNamed:imageName];
    UIImageView *icon = [[UIImageView alloc] initWithImage:image];
    icon.contentMode = UIViewContentModeScaleAspectFit;
    icon.tintColor = [UIColor whiteColor];

    // textfiled
    UITextField *textFileld = [[UITextField alloc] init];
    textFileld.text = hint;
    
    [container addSubview:icon];
    [container addSubview:textFileld];
    
    // icon layout
    [icon disableTranslatesAutoresizingMaskIntoConstraints];
    [icon addWidthConstraint:24];
    [icon addHeightConstraint:24];
    [icon addYCenterConstraint:container.centerYAnchor];
    [icon addLeftConstraint:container.leftAnchor withPadding:8];

    return container;
}

#pragma mark - Listeners

- (void)buttonClicked {
    RegistrationViewController *vc = [[RegistrationViewController alloc] init];
    [self.navigationController showViewController:vc sender:nil];
}

@end
