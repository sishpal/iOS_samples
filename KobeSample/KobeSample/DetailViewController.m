//
//  DetailViewController.m
//  KobeSample
//
//  Created by Beryl Systems on 01/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "DetailViewController.h"
#import "RootViewController.h"

@interface DetailViewController ()

@end


@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Sign Up";
    self.dicFacebookInfo =[[NSMutableDictionary alloc]init];
    [self.navigationItem setHidesBackButton:YES];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    self.m_datePicker.hidden = YES;
    self.m_btnDone.hidden = YES;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}


#pragma mark
#pragma Facebook integration

-(IBAction)onSignUpWithFacebookButtonPressed:(id)sender {
    NSLog(@"Sign Up with Facebook button is pressed");
    [self fbSample];

}


-(void)fbSample {
    NSArray *permissions = nil;
    if ([FBSDKAccessToken currentAccessToken].declinedPermissions.count > 0) {
        permissions = [FBSDKAccessToken currentAccessToken].declinedPermissions.allObjects;
    }
    else {
        permissions = @[@"email", @"public_profile", @"user_birthday"];
    }
    FBSDKLoginManager *fbsdkLoginManager = [[FBSDKLoginManager alloc] init];
    [fbsdkLoginManager logOut];
    [fbsdkLoginManager logInWithReadPermissions:permissions fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error)
     {
//         NSLog(@"error is => %@",error);
         if (error) {
//             NSLog(@"ero is %@",error);
         }
         else if (result.isCancelled) {
             UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Login Failure" message:@"Kobe needs permission to your Facebook public profile and email address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
             [alertView show];
         }
         else {
             [self getFaceBookData];
         }
     }];

}


- (void)getFaceBookData {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 NSString *access_token =[FBSDKAccessToken currentAccessToken].tokenString;
                 NSLog(@"Access token is => %@",access_token);
                 NSLog(@"result is %@",result);
                 NSString *fb_id = [Utility getFormattedValue:[result objectForKey:@"id"]];
                 self.m_fbId = fb_id;
                 self.m_access_token = access_token;
                 [self facebookAccountVerification :fb_id];
             }
             else {
                 [MBProgressHUD hideHUDForView:self.view animated:YES];
             }
         }];
    }

}


-(void)facebookAccountVerification:(NSString *)fb_id {
    NGAPIClient *client = [NGAPIClient sharedHTTPClient];
    [client facebookAccountVerification : fb_id completion:^(NSMutableDictionary *message, NSError *error)
     {
         if(error) {
//             NSLog(@"Something bad happend. Please try again.");
//             NSLog(@"error iis => %@",error);
             [MBProgressHUD hideHUDForView:self.view animated:YES];
         }
         else {
             [MBProgressHUD hideHUDForView:self.view animated:YES];
//             NSLog(@"message from facebookAccountVerification => %@",message);
             NSString *sStatus = [Utility getFormattedValue:[message objectForKey:@"status"]];
             NSString *sErrorCode = [Utility getFormattedValue:[message objectForKey:@"error_code"]];
             if([sStatus isEqualToString:@"200"] && sErrorCode.length <= 0) {
                 NSLog(@"Save Data into DataHolder");
             }
             else {
                 [self getFacebookInfoFromGraphAPI:self.m_access_token];
             }
         }
     }];

}


- (void)getFacebookInfoFromGraphAPI : (NSString *)accessToken {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NGAPIClient *client = [NGAPIClient sharedHTTPClient];
    [client getFaceBookInfoFromGraphAPI:accessToken completion:^(NSMutableDictionary *message, NSError *error) {
         if(error)
         {
             [MBProgressHUD hideHUDForView:self.view animated:YES];
             [Utility showAlertWithTitle:@"Oops" withMessage:@"Something bad happened. Please try again."];
         }
         else {
             [MBProgressHUD hideHUDForView:self.view animated:YES];
             if([message objectForKey:@"errors"]) {
                 [Utility showAlertWithTitle:kAppName withMessage:[message objectForKey:@"errors"]];
             }
             else {
                 self.faceBookInfo = [[FacebookInfo alloc]initwithFacebookInfo:message];
                 self.faceBookInfo.m_sAccessToken = [FBSDKAccessToken currentAccessToken].tokenString;
                 self.sIsProvider = @"facebook";
             }
//             NSLog(@"message by graphics API %@",message);
             self.dicFacebookInfo = message;
             // check here email or date of birth.
             NSString *email = [Utility getFormattedValue:[self.dicFacebookInfo objectForKey:@"email"]];
             NSString *dateOfBirth = [Utility getFormattedValue:[self.dicFacebookInfo objectForKey:@"birthday"]];
             if([email isEqualToString:@""] && [dateOfBirth isEqualToString:@""]) {
//                 NSLog(@"Enter the emailAddress and date of birth both");
                 EmailViewController *emailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"EmailViewController"];
                 emailVC.m_dicFacebookInfo = self.dicFacebookInfo;
                 emailVC.m_fbId = self.m_fbId;
                 [self.navigationController pushViewController:emailVC animated:YES];
             }
             else if([email isEqualToString:@""]) {
//                 NSLog(@"Enter the emailAddress");
                 EmailViewController *emailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"EmailViewController"];
                 emailVC.m_dicFacebookInfo = self.dicFacebookInfo;
                 emailVC.m_fbId = self.m_fbId;
                 [self.navigationController pushViewController:emailVC animated:YES];
             }
             else if([dateOfBirth isEqualToString:@""]) {
//                 NSLog(@"Enter the date of birth");
                 EmailViewController *emailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"EmailViewController"];
                 emailVC.m_dicFacebookInfo = self.dicFacebookInfo;
                 emailVC.m_fbId = self.m_fbId;
                 [self.navigationController pushViewController:emailVC animated:YES];
             }
             else{
                 [self SignUpUserViaFacebook];
             }
         }
     }];
}


-(void)SignUpUserViaFacebook {
    NGAPIClient *client = [NGAPIClient sharedHTTPClient];
    [client SignUpUserViaFacebook : [self setJsonDataForSignUpUserViaFacebook] completion:^(NSMutableDictionary *message, NSError *error) {
         if(error) {
//             NSLog(@"Something bad happend. Please try again.");
//             NSLog(@"errors => %@",error);
             [MBProgressHUD hideHUDForView:self.view animated:YES];
         }
         else {
             [MBProgressHUD hideHUDForView:self.view animated:YES];
             NSString *sStatus = [Utility getFormattedValue:[message objectForKey:@"status"]];
             NSString *sErrorCode = [Utility getFormattedValue:[message objectForKey:@"error_code"]];
             if([sStatus isEqualToString:@"200"] && sErrorCode.length <= 0) {
//                 NSLog(@"Save Data into DataHolder");
                 UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:@"Congratulations" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"ok", nil];
                 [alertView show];
             }
             else {
//                 NSLog(@"message from SignUpUserViaFacebook => %@",message);
                 NSString *errorMessage = [Utility getFormattedValue:[message objectForKey:@"message"]];
                 UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:[NSString stringWithFormat:@"%@",errorMessage] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"ok", nil];
                 [alertView show];
             }
         }
     }];

}


-(NSMutableDictionary *)setJsonDataForSignUpUserViaFacebook {
    NSMutableDictionary *dicFinal =[[NSMutableDictionary alloc]init];
    NSMutableDictionary *dicUser =[[NSMutableDictionary alloc]init];
    NSMutableDictionary *dicData = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *dictAttributes = [[NSMutableDictionary alloc]init];
//    NSLog(@"userinfo from facebook==%@",self.dicFacebookInfo);
    NSString *first_name = [Utility getFormattedValue:[self.dicFacebookInfo objectForKey:@"first_name"]];
    NSString *last_name = [Utility getFormattedValue:[self.dicFacebookInfo objectForKey:@"last_name"]];
    NSString *email = [Utility getFormattedValue:[self.dicFacebookInfo objectForKey:@"email"]];
    NSString *dateOfBirth = [Utility getFormattedValue:[self.dicFacebookInfo objectForKey:@"birthday"]];
    [dictAttributes setObject:first_name forKey:@"first_name"];
    [dictAttributes setObject:last_name forKey:@"last_name"];
    [dictAttributes setObject:email forKey:@"email"];
    [dictAttributes setObject:dateOfBirth forKey:@"date_of_birth"];
    [dictAttributes setObject:self.m_fbId forKey:@"fb_uid"];
    [dictAttributes setObject:@"facebook" forKey:@"provider"];
    [dicData setObject:dictAttributes forKey:@"attributes"];
    [dicUser setObject:dicData forKey:@"data"];
    [dicFinal setObject:dicUser forKey:@"user"];
    return dicFinal;
    
}


#pragma mark
#pragma Method for registeration

-(void)userInfo {
        NGAPIClient *client = [NGAPIClient sharedHTTPClient];
        [client getUserInfo : [self setJsonData] completion:^(NSMutableDictionary *message, NSError *error) {
             if(error) {
                 NSLog(@"Something bad happend. Please try again.");
             }
             else
             {
//                 NSLog(@"message is => %@",message);
                 NSString *status =  [Utility  getFormattedValue:[message objectForKey:@"status"]];
                 NSString *errorCode =  [Utility  getFormattedValue:[message objectForKey:@"error_code"]];
//                 NSLog(@"error code is => %@",errorCode);
//                 NSLog(@"status %@",status);
                 if([status isEqualToString:@"200"] && errorCode.length == 0 ) {
                     NSDictionary *dicUser = [Utility getFormattedValue:[message objectForKey:@"user"]];
//                     NSLog(@"user info is  => %@",dicUser);
                     NSDictionary *dicData = [Utility getFormattedValue:[dicUser objectForKey:@"data"]];
//                     NSLog(@"user data is => %@",dicData);
                     [[NSUserDefaults standardUserDefaults]setObject:dicData forKey:@"userdata"];
                     [[NSUserDefaults standardUserDefaults]synchronize];
                     RootViewController *showallvenuevC = [self.storyboard instantiateViewControllerWithIdentifier:@"rootController"];
                     [self presentViewController:showallvenuevC animated:YES completion:nil];
                 }
                 else {
                     NSLog(@"Status not match");
                 }
             }
     }];

}


- (NSMutableDictionary *)setJsonData {
    NSMutableDictionary *dicFinal =[[NSMutableDictionary alloc]init];
    NSMutableDictionary *dicUser =[[NSMutableDictionary alloc]init];
    NSMutableDictionary *dicData = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *dictAttribute = [[NSMutableDictionary alloc]init];
    [dictAttribute setObject:self.m_txtFirstName.text forKey:@"first_name"];
    [dictAttribute setObject:self.m_txtlastName.text forKey:@"last_name"];
    [dictAttribute setObject:self.m_txtEmailAddress.text forKey:@"email"];
    [dictAttribute setObject:self.m_txtPassword.text forKey:@"password"];
    [dictAttribute setObject:@"email" forKey:@"provider"];
    [dictAttribute setObject:@"ios" forKey:@"device_type"];
    [dictAttribute setObject:@"123123qweqweqwe21313" forKey:@"device_token"];
    [dictAttribute setObject:self.m_btnDateOfBirth.titleLabel.text forKey:@"date_of_birth"];
    [dicData setObject:dictAttribute forKey:@"attributes"];
    [dicUser setObject:dicData forKey:@"data"];
    [dicFinal setObject:dicUser forKey:@"user"];
//    NSLog(@"dicAttribute is => %@",dicFinal);
    return dicFinal;
    
}


#pragma mark
#pragma setSCrollWhenKeyUp method

-(void)setScrollWhenKeyboardUp
{
//    NSLog(@"setScrollWhenKeyUp method is called");
//    self.m_datePicker.hidden = YES;
    if([[Utility iPhoneModel]isEqualToString:@"iphone5s"]) {
        if (!([self.m_txtActive isEqual:self.m_txtFirstName] || [self.m_txtActive isEqual:self.m_txtlastName])) {
            [self.m_scrollView setContentOffset:CGPointMake(0, 115) animated:YES];
        }
        [self.m_scrollView setContentSize:(CGSizeMake(self.m_scrollView.frame.size.width, self.m_scrollView.frame.size.height +241))];
    }
    else if([[Utility iPhoneModel]isEqualToString:@"iphone6"]) {
        if(![self.m_txtActive isEqual:self.m_txtFirstName]) {
            [self.m_scrollView setContentOffset:CGPointMake(0, 65) animated:YES];
        }
        [self.m_scrollView setContentSize:(CGSizeMake(self.m_scrollView.frame.size.width, self.m_scrollView.frame.size.height +107))];
    }
    else if([[Utility iPhoneModel]isEqualToString:@"iphone6+"]) {
        [self.m_scrollView setContentSize:(CGSizeMake(self.m_scrollView.frame.size.width, self.m_scrollView.frame.size.height +50))];
    }

}


#pragma mark
#pragma setSCrollWhenKeyDown method

-(void)setScrollWhenKeyDown {
    NSLog(@"setScrollWhenJeyboardDown method called");
    [self.m_scrollView setContentSize:(CGSizeMake(0,0))];
    [self.m_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];

}


#pragma mark
#pragma mark - UITextField Delegates

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    self.m_txtActive = textField;
    [self setScrollWhenKeyboardUp];

}


- (IBAction)onBackButtonPressed:(id)sender {
    NSLog(@"Back button pressed");
    [self.navigationController popViewControllerAnimated:YES];

}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self setScrollWhenKeyDown];
    return YES;

}


-(IBAction)onDateofBirthButtonPressed:(id)sender {
    self.m_datePicker.hidden = NO;
    self.m_datePicker.backgroundColor = [UIColor lightGrayColor];
    self.m_btnDone.backgroundColor = [UIColor lightGrayColor];
    self.m_btnDone.hidden = NO;
    NSDate *date = [self.m_datePicker date];
//    NSLog(@"date is -> %@",date);
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
    NSString *outputString = [formatter stringFromDate:date];
//    NSLog(@"new formate of date is => %@",outputString);
    [self.m_btnDateOfBirth setTitle:[NSString stringWithFormat:@"%@",outputString] forState:UIControlStateNormal];

}


- (BOOL)checkValidation {
    if([self.m_txtFirstName.text isEqualToString:@""]) {
        NSLog(@"Please Enter the First Name");
        return NO;
    }
    else if([self.m_txtlastName.text isEqualToString:@""]) {
        NSLog(@"Please Enter the Last Name");
        return NO;
    }
    else if([self.m_txtEmailAddress.text isEqualToString:@""]) {
        NSLog(@"Please Enter the Email Address");
        return NO;
    }
    else if([self.m_txtPassword.text isEqualToString:@""]) {
        NSLog(@"Please Enter the Password");
        return NO;
    }
    else if([self.m_btnDateOfBirth.titleLabel.text isEqualToString:@""]) {
       NSLog(@"Please Select the Date of Birth");
        return NO;
    }
    else {
        return YES;
    }

}


-(IBAction)onSignUpButtonPressed:(id)sender {
    NSLog(@"SignInButton Pressed");
    if([self checkValidation]) {
        [self userInfo];
    }
    else{
        UIActionSheet *actionSheetSign = [[UIActionSheet alloc]initWithTitle:@"Please Enter the all Fields Requirment." delegate:self cancelButtonTitle:@"Ok" destructiveButtonTitle:nil otherButtonTitles:nil, nil];
        [actionSheetSign showInView:self.view];
    }

}


-(IBAction)onDoneButtonPressed:(id)sender {
    NSLog(@"Done Button Pressed");
    self.m_datePicker.hidden = YES;
    self.m_btnDone.hidden = YES;

}



@end
