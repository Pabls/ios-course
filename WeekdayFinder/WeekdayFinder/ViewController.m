#import "ViewController.h"

@interface ViewController ()
@property(strong, nonatomic) UILabel *titleLabel;

@property(strong, nonatomic) UILabel *yearLabel;
@property(strong, nonatomic) UILabel *monthLabel;
@property(strong, nonatomic) UILabel *dayLabel;

@property(strong, nonatomic) UITextField *yearTextFiled;
@property(strong, nonatomic) UITextField *monthTextFiled;
@property(strong, nonatomic) UITextField *dayTextFiled;

@property(strong, nonatomic) UILabel *resultLabel;

@property(strong, nonatomic) UIButton *findDayButton;
@end


@implementation ViewController

#pragma mark -Private vars

CGFloat labelWidth = 60;
CGFloat standartMargin = 16;
CGFloat textFieldHeight = 32;
CGFloat standartTopMargin = 36;

#pragma mark -Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareAndAddTitle];
    [self prepareAndAddLabels];
    [self prepareAndAddTextFields];
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.titleLabel.frame = CGRectMake(0, standartTopMargin, self.view.frame.size.width, textFieldHeight);
    
    CGFloat yearLabelTopMargin = self.titleLabel.frame.size.height + standartTopMargin + standartMargin;
    self.yearLabel.frame = CGRectMake(standartMargin, yearLabelTopMargin, labelWidth, textFieldHeight);
    
    CGFloat textFieldWidth = self.view.frame.size.width - (self.yearLabel.frame.size.width + standartMargin + standartMargin);
    CGFloat textFieldXOffset = self.yearLabel.frame.size.width + standartMargin;
    self.yearTextFiled.frame = CGRectMake(textFieldXOffset, yearLabelTopMargin, textFieldWidth, textFieldHeight);
    
    CGFloat monthLabelTopMargin = yearLabelTopMargin + self.yearLabel.frame.size.height + standartTopMargin;
    self.monthLabel.frame = CGRectMake(standartMargin, monthLabelTopMargin, labelWidth, textFieldHeight);
    
    self.monthTextFiled.frame = CGRectMake(textFieldXOffset, monthLabelTopMargin, textFieldWidth, textFieldHeight);
    
    CGFloat dayLabelTopMargin = monthLabelTopMargin + self.monthLabel.frame.size.height + standartTopMargin;
    self.dayLabel.frame = CGRectMake(standartMargin, dayLabelTopMargin, labelWidth, standartTopMargin);
    
    self.dayTextFiled.frame = CGRectMake(textFieldXOffset, dayLabelTopMargin, textFieldWidth, textFieldHeight);
}

#pragma mark -Private methods for init views
- (void) prepareAndAddTitle {
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-Heavy" size:24];
    self.titleLabel.text = @"Weekday finder";
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = UIColor.blackColor;
    [self.view addSubview: self.titleLabel];
}

- (void) prepareAndAddLabels {
    self.yearLabel = [[UILabel alloc] init];
    self.monthLabel = [[UILabel alloc] init];
    self.dayLabel = [[UILabel alloc] init];
    [self prepareLabel:self.yearLabel withtext:@"Year : "];
    [self prepareLabel:self.monthLabel withtext:@"Month : "];
    [self prepareLabel:self.dayLabel withtext:@"Day : "];
}

- (void) prepareAndAddTextFields {
    self.yearTextFiled = [[UITextField alloc] init];
    self.monthTextFiled = [[UITextField alloc] init];
    self.dayTextFiled = [[UITextField alloc] init];
    [self prepareTextField:self.yearTextFiled withPlaceholder:@"Enter year"];
    [self prepareTextField:self.monthTextFiled withPlaceholder:@"Enter month"];
    [self prepareTextField:self.dayTextFiled withPlaceholder:@"Enter day"];
}

- (void) prepareLabel: (UILabel *) label withtext: (NSString *) text {
    label.font = [UIFont fontWithName:@"AvenirNextCondensed-Heavy" size:16];
    label.text = text;
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = UIColor.lightGrayColor;
    [self.view addSubview: label];
}

- (void) prepareTextField: (UITextField *) textField withPlaceholder: (NSString *) placeholder {
    textField.placeholder = placeholder;
    textField.keyboardType =  UIKeyboardTypeNumberPad;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview: textField];
}

@end
