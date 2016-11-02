//
//  EmailViewController.m
//  KobeSample
//
//  Created by Beryl Systems on 20/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "EmailViewController.h"

@interface EmailViewController ()

@end

@implementation EmailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"facebook info. => %@",self.m_dicFacebookInfo);
    self.m_datePicker.hidden = YES;
    self.m_btnDone.hidden = YES;
    NSString *email = [Utility getFormattedValue:[self.m_dicFacebookInfo objectForKey:@"email"]];
    NSString *dateOfBirth = [Utility getFormattedValue:[self.m_dicFacebookInfo objectForKey:@"birthday"]];
    if([email isEqualToString:@""] && [dateOfBirth isEqualToString:@""]) {
        NSLog(@"Enter email and date of birth");
    }
    else if([email isEqualToString:@""]) {
        NSLog(@"enter email");
        self.m_btnDateOfBirth.hidden = YES;
    }
    else if([dateOfBirth isEqualToString:@""]) {
        NSLog(@"date of birth");
        self.m_txtfEmail.hidden = YES;
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

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


-(IBAction)onDoneButtonPressed:(id)sender {
    NSLog(@"Done Button Pressed");
    self.m_datePicker.hidden = YES;
    self.m_btnDone.hidden = YES;

}


-(IBAction)onSubmitButtonPressed:(id)sender {
    [self SignUpUserViaFacebook];

}


-(void)SignUpUserViaFacebook {
    NGAPIClient *client = [NGAPIClient sharedHTTPClient];
    [client SignUpUserViaFacebook : [self setJsonDataForSignUpUserViaFacebook] completion:^(NSMutableDictionary *message, NSError *error) {
         if(error) {
             NSLog(@"Something bad happend. Please try again.");
             NSLog(@"errors => %@",error);
             [MBProgressHUD hideHUDForView:self.view animated:YES];
         }
         else {
             [MBProgressHUD hideHUDForView:self.view animated:YES];
             NSString *sStatus = [Utility getFormattedValue:[message objectForKey:@"status"]];
             NSString *sErrorCode = [Utility getFormattedValue:[message objectForKey:@"error_code"]];
             if([sStatus isEqualToString:@"200"] && sErrorCode.length <= 0) {
                 NSLog(@"Save Data into DataHolder");
                 UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:@"Congratulations" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"ok", nil];
                 [alertView show];
             }
             else {
                 NSLog(@"message from SignUpUserViaFacebook => %@",message);
                 NSString *sMessage = [Utility getFormattedValue:[message objectForKey:@"message"]];
                 UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:[NSString stringWithFormat:@"%@", sMessage] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"ok", nil];
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
//    NSLog(@"userinfo from facebook==%@",self.m_dicFacebookInfo);
    NSString *first_name = [Utility getFormattedValue:[self.m_dicFacebookInfo objectForKey:@"first_name"]];
    NSString *last_name = [Utility getFormattedValue:[self.m_dicFacebookInfo objectForKey:@"last_name"]];
    NSString *email = [Utility getFormattedValue:[self.m_dicFacebookInfo objectForKey:@"email"]];
    if([email isEqualToString:@""]) {
        email = self.m_txtfEmail.text;
    }
    NSString *dateOfBirth = [Utility getFormattedValue:[self.m_dicFacebookInfo objectForKey:@"birthday"]];
    if([dateOfBirth isEqualToString:@""]) {
        dateOfBirth = self.m_btnDateOfBirth.titleLabel.text;
    }
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


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
