//
//  BaseAuthViewController.m
//  Aligatter
//
//  Created by Павел Семин on 3/2/22.
//

#import "BaseAuthViewController.h"
#import "UIView+UIViewAddAnchor.h"

@interface BaseAuthViewController ()

@end

@implementation BaseAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUI];
}

-(void)setImage: (UIImage *) image {
    [self.logoImage setImage:image];
    self.logoImage.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    self.logoImage.layer.cornerRadius = image.size.width / 2;
}

#pragma mark - UI configuration private methods

-(void)configureUI {
    self.view.backgroundColor = [UIColor systemGreenColor];
    [self.navigationController.navigationBar setHidden:YES];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [self configureLogo];
}

-(void)configureLogo {
    self.logoImage = [[UIImageView alloc] init];
    self.logoImage.layer.backgroundColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:self.logoImage];
    
    [self.logoImage disableTranslatesAutoresizingMaskIntoConstraints];
    [self.logoImage addTopConstraint:self.view.safeAreaLayoutGuide.topAnchor withPadding:16];
    [self.logoImage addXCenterConstraint:self.view.centerXAnchor];
}

@end
