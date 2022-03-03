//
//  ExploreViewController.m
//  Aligatter
//
//  Created by Павел Семин on 2/26/22.
//

#import "ExploreViewController.h"
#import "StringsResources.h"

@interface ExploreViewController ()

@end

@implementation ExploreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUi];
}

#pragma mark - UI configuration

- (void)configureUi {
    self.navigationItem.title = EXPLORE_TITLE;
}
@end
