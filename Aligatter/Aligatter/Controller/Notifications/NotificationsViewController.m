//
//  NotificationsViewController.m
//  Aligatter
//
//  Created by Павел Семин on 2/26/22.
//

#import "NotificationsViewController.h"
#import "StringsResources.h"

@interface NotificationsViewController ()

@end

@implementation NotificationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUi];
}

#pragma mark - UI configuration

- (void) configureUi {
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = NOTIFICATIONS_TITLE;
}
@end
