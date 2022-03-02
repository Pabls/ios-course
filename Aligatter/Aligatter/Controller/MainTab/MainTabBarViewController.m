//
//  MainTabBarViewController.m
//  Aligatter
//
//  Created by Павел Семин on 2/26/22.
//

#import "MainTabBarViewController.h"

#import "ConversationsViewController.h"
#import "NotificationsViewController.h"
#import "ExploreViewController.h"
#import "FeedViewController.h"

#import "UIView+UIViewAddAnchor.h"

#import "ImagesResources.h"

@interface MainTabBarViewController ()
@property (strong, nonatomic) UIButton *actionButton;
@end

@implementation MainTabBarViewController

#pragma mark - Private vars

CGFloat buttonSize = 56;

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configureControllers];
    [self configureUi];
}

#pragma mark - UI configuration

- (void) configureControllers {
    FeedViewController *feedViewController = [[FeedViewController alloc] init];
    UINavigationController *feedNavigationController = [self getNavigationControllerWithImage:HOUSE_IMG_NAME andRootViewController:feedViewController];
    
    ExploreViewController *exploreViewController = [[ExploreViewController alloc] init];
    UINavigationController *exploreNavigationController = [self getNavigationControllerWithImage:SEARCH_IMG_NAME andRootViewController:exploreViewController];
    
    
    NotificationsViewController *notificationsViewController = [[NotificationsViewController alloc] init];
    UINavigationController *notificationsNavigationController = [self getNavigationControllerWithImage:HEART_IMG_NAME andRootViewController:notificationsViewController];
    
    ConversationsViewController *conversationsViewController = [[ConversationsViewController alloc] init];
    UINavigationController *conversationsNavigationController = [self getNavigationControllerWithImage:ENVELOPE_IMG_NAME andRootViewController:conversationsViewController];
    
    self.viewControllers = [NSArray arrayWithObjects:
                            feedNavigationController,
                            exploreNavigationController,
                            notificationsNavigationController,
                            conversationsNavigationController,
                            nil ];
}

- (UINavigationController *) getNavigationControllerWithImage:(NSString *) image andRootViewController:(UIViewController *) controller {
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    navigationController.tabBarItem.image = [UIImage systemImageNamed:image];
    navigationController.navigationBar.tintColor = [UIColor whiteColor];
    return navigationController;
}

- (void) configureUi {
    self.tabBar.tintColor = [UIColor systemGreenColor];
    [self configureButton];
    [self.view addSubview:self.actionButton];
    [self addConstraintsToButton];
}

- (void) configureButton {
    self.actionButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.actionButton.backgroundColor = [UIColor systemGreenColor];
    self.actionButton.tintColor = [UIColor whiteColor];
    self.actionButton.layer.cornerRadius = buttonSize / 2;
    [self.actionButton setImage:[UIImage systemImageNamed:TEXT_BADGE_IMG_NAME] forState:UIControlStateNormal];
    [self.actionButton addTarget:self action:@selector(onActionButtonTap) forControlEvents:UIControlEventTouchUpInside];
}

- (void) addConstraintsToButton {
    [self.actionButton disableTranslatesAutoresizingMaskIntoConstraints];
    [self.actionButton addWidthConstraint:buttonSize];
    [self.actionButton addHeightConstraint:buttonSize];
    [self.actionButton addBottomConstraint:self.view.safeAreaLayoutGuide.bottomAnchor withPadding:-64];
    [self.actionButton addRightConstraint:self.view.rightAnchor withPadding:-16];
}

#pragma mark - Actions

- (void) onActionButtonTap {
    NSLog(@"button tapped");
}

@end
