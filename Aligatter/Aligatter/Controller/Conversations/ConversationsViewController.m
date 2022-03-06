//
//  ConversationsViewController.m
//  Aligatter
//
//  Created by Павел Семин on 2/26/22.
//

#import "ConversationsViewController.h"
#import "StringsResources.h"

@interface ConversationsViewController ()

@end

@implementation ConversationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUi];
}

#pragma mark - UI configuration

- (void)configureUi {
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = CONVERSATIONS_TITLE;
}

@end
