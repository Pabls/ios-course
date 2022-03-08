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
    UIView *emailInput = [super createTextFieldWithImage:ENVELOPE_IMG_NAME andPlaceholder:EMAIL andSetSecurityText:NO];
    UIView *passwordInput = [super createTextFieldWithImage:LOCK_IMG_NAME andPlaceholder:PASSWORD andSetSecurityText:YES];
    
    UIButton *loginButton = [super createActionButtonWithTitle:LOG_IN];
   
    [super setTextFieldViews:[[NSArray alloc] initWithObjects:emailInput, passwordInput, loginButton, nil]];
    
    [super setLinkDescription:DONT_HAVE_ACCOUNT andButtonText:SIGN_UP];
}

#pragma mark - Listeners

- (void)bottomButtonClick {
    RegistrationViewController *vc = [[RegistrationViewController alloc] init];
    [self.navigationController showViewController:vc sender:nil];
}

@end
