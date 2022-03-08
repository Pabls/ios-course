//
//  RegistrationViewController.m
//  Aligatter
//
//  Created by Павел Семин on 2/27/22.
//

#import "RegistrationViewController.h"
#import "ImagesResources.h"
#import "StringsResources.h"

@interface RegistrationViewController ()

@end

@implementation RegistrationViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUi];
}

#pragma mark - UI configuration

- (void)configureUi {
    [super setImage:[UIImage imageNamed:PLUS_IMG_NAME]];
    [super setLinkDescription:ALREADY_HAVE_ACCOUNT andButtonText:LOG_IN];
}

#pragma mark - Listeners

- (void)bottomButtonClick {
    [self.navigationController popViewControllerAnimated:TRUE];
}

- (void)iconClicked {
    NSLog(@"iconClicked");
}
@end
