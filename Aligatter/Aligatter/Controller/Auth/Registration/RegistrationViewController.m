//
//  RegistrationViewController.m
//  Aligatter
//
//  Created by Павел Семин on 2/27/22.
//

#import "RegistrationViewController.h"

@interface RegistrationViewController ()

@end

@implementation RegistrationViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUi];
}

#pragma mark - UI configuration

- (void) configureUi {
    self.view.backgroundColor = [UIColor systemGreenColor];
    [self.navigationController.navigationBar setHidden:YES];
}

@end
