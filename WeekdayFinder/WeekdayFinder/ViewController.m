//
//  ViewController.m
//  WeekdayFinder
//
//  Created by Павел Семин on 2/15/22.
//

#import "ViewController.h"

@interface ViewController ()
@property(strong, nonatomic) UILabel *titleLabel;

@property(strong, nonatomic) UILabel *yearLabel;
@property(strong, nonatomic) UILabel *monthLabel;
@property(strong, nonatomic) UILabel *dayLabel;
@end

@implementation ViewController

#pragma mark -Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel = [[UILabel alloc] init];
    [self.view addSubview: self.titleLabel];
}

- (void)viewDidLayoutSubviews {
    NSLog(@"viewDidLayoutSubviews");
    
    self.titleLabel.frame = [self getTitleFrame];
    
    self.titleLabel.text = @"Weekday finder";
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = UIColor.blackColor;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}

- (void)viewWillLayoutSubviews {
    NSLog(@"viewWillLayoutSubviews");
}

#pragma mark - Private methods

-(CGRect) getTitleFrame {
    return CGRectMake(0, 24, self.view.frame.size.width, 24);
}
@end
