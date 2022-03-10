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
@property (strong, nonatomic) UIImagePickerController *imagePicker;
@end

@implementation RegistrationViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUi];
}

#pragma mark - UI configuration

- (void)configureUi {
    [self configureImagePicker];
    
    [super setImage:[UIImage imageNamed:PLUS_IMG_NAME]];
    
    UIView *emailInput = [super createTextFieldWithImage:ENVELOPE_IMG_NAME andPlaceholder:EMAIL andSetSecurityText:NO];
    UIView *passwordInput = [super createTextFieldWithImage:LOCK_IMG_NAME andPlaceholder:PASSWORD andSetSecurityText:YES];
    UIView *fullNameInput = [super createTextFieldWithImage:PERSON_IMG_NAME andPlaceholder:FULL_NAME andSetSecurityText:NO];
    UIView *userNameInput = [super createTextFieldWithImage:PERSON_IMG_NAME andPlaceholder:USER_NAME andSetSecurityText:NO];
    
    UIButton *signUpButton = [super createActionButtonWithTitle:SIGN_UP];
    
    [super setTextFieldViews:[[NSArray alloc] initWithObjects:emailInput, passwordInput, fullNameInput, userNameInput, signUpButton, nil]];
    
    [super setLinkDescription:ALREADY_HAVE_ACCOUNT andButtonText:LOG_IN];
}

- (void)configureImagePicker {
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.allowsEditing = YES;
    self.imagePicker.delegate = self;
}

#pragma mark - Listeners

- (void)actionButtonClick {
    NSLog(@"registration actionButtonClick");
}

- (void)bottomButtonClick {
    [self.navigationController popViewControllerAnimated:TRUE];
}

- (void)iconClicked {
    [super presentViewController:self.imagePicker animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    UIImage *avatarImage = [info valueForKey:UIImagePickerControllerOriginalImage];
    if(avatarImage != nil) {
        [super setImage:avatarImage];
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
