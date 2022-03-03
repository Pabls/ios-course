//
//  FeedViewController.m
//  Aligatter
//
//  Created by Павел Семин on 2/26/22.
//

#import "FeedViewController.h"
#import "ImagesResources.h"

@interface FeedViewController ()

@end

@implementation FeedViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUi];
}

#pragma mark - UI configuration

- (void)configureUi {
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage *image = [UIImage imageNamed:LOGO_IMG_NAME];
    UIImageView *icon = [[UIImageView alloc] initWithImage:image];
    icon.contentMode = UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView = icon;
}
@end
