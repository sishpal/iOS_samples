//
//  DetailViewController.m
//  KobeSample
//
//  Created by Beryl Systems on 01/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Sign Up";

    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    self.m_datePicker.hidden = YES;
    self.m_btnDone.hidden = YES;


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma Method

-(void)userInfo
{
        NGAPIClient *client = [NGAPIClient sharedHTTPClient];
        [client getUserInfo : [self setJsonData] completion:^(NSMutableDictionary *message, NSError *error)
         {
             if(error)
             {
                 NSLog(@"Something bad happend. Please try again.");
             }
             else
             {
                 NSLog(@"message is => %@",message);
                 
                 NSString *status =  [Utility  getFormattedValue:[message objectForKey:@"status"]];
                 NSString *errorCode =  [Utility  getFormattedValue:[message objectForKey:@"error_code"]];
                 NSLog(@"error code is => %@",errorCode);
                 NSLog(@"status %@",status);
                 
                 if([status isEqualToString:@"200"] && errorCode.length == 0 ){
                 
                     NSDictionary *dicUser = [Utility getFormattedValue:[message objectForKey:@"user"]];
                     NSLog(@"user info is  => %@",dicUser);
                 
                     NSDictionary *dicData = [Utility getFormattedValue:[dicUser objectForKey:@"data"]];
                     NSLog(@"user data is => %@",dicData);

                     [[NSUserDefaults standardUserDefaults]setObject:message forKey:@"userdata"];
                     [[NSUserDefaults standardUserDefaults]synchronize];
        
                     AfterSignUpViewController *detailsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"AfterSignUpViewController"];
                     [self.navigationController pushViewController:detailsVC animated:YES];
                 }
                 else
                 {
                     
                 }
             }
     }];
}

- (NSMutableDictionary *)setJsonData
{
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
    NSLog(@"dicAttribute is => %@",dicFinal);

    return dicFinal;
}


#pragma mark
#pragma setSCrollWhenKeyUp method

-(void)setScrollWhenKeyboardUp
{
    NSLog(@"setScrollWhenKeyUp method is called");
//    self.m_datePicker.hidden = YES;
    if([[Utility iPhoneModel]isEqualToString:@"iphone5s"])
    {
        if (!([self.m_txtActive isEqual:self.m_txtFirstName] || [self.m_txtActive isEqual:self.m_txtlastName]))
        {
            
            [self.m_scrollView setContentOffset:CGPointMake(0, 115) animated:YES];
        }
        [self.m_scrollView setContentSize:(CGSizeMake(self.m_scrollView.frame.size.width, self.m_scrollView.frame.size.height +241))];
    }
    else if([[Utility iPhoneModel]isEqualToString:@"iphone6"])
    {
        if (![self.m_txtActive isEqual:self.m_txtFirstName])
        {
            
            [self.m_scrollView setContentOffset:CGPointMake(0, 65) animated:YES];
        }
        [self.m_scrollView setContentSize:(CGSizeMake(self.m_scrollView.frame.size.width, self.m_scrollView.frame.size.height +107))];
    }
    else if([[Utility iPhoneModel]isEqualToString:@"iphone6+"])
    {
        [self.m_scrollView setContentSize:(CGSizeMake(self.m_scrollView.frame.size.width, self.m_scrollView.frame.size.height +50))];
    }
}


#pragma mark
#pragma setSCrollWhenKeyDown method


-(void)setScrollWhenKeyDown
{
    NSLog(@"setScrollWhenKeyDown method is called");
    
    [self.m_scrollView setContentSize:(CGSizeMake(0,0))];
    [self.m_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
}

#pragma mark
#pragma mark - UITextField Delegates


-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"beginEditing");
    self.m_txtActive = textField;
    [self setScrollWhenKeyboardUp];
}


-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"endEditing");
}


- (IBAction)onBackButtonPressed:(id)sender
{
    NSLog(@"Register button pressed");
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    NSLog(@"retun called");
    [self setScrollWhenKeyDown];
    return YES;
}


-(IBAction)onDateofBirthButtonPressed:(id)sender
{
    self.m_datePicker.hidden = NO;
    self.m_datePicker.backgroundColor = [UIColor lightGrayColor];
    self.m_btnDone.backgroundColor = [UIColor lightGrayColor];
    self.m_btnDone.hidden = NO;
    NSLog(@"Pressed selectedDate");
    NSDate *date = [self.m_datePicker date];
    NSLog(@"date is -> %@",date);
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
    NSString *outputString = [formatter stringFromDate:date];
    NSLog(@"new formate of date is => %@",outputString);
    [self.m_btnDateOfBirth setTitle:[NSString stringWithFormat:@"%@",outputString] forState:UIControlStateNormal];
    
}
- (BOOL)checkValidation
{
    if([self.m_txtFirstName.text isEqualToString:@""])
    {
        NSLog(@"Please Enter the First Name");
        return NO;
        
    }
    else if([self.m_txtlastName.text isEqualToString:@""])
    {
        NSLog(@"Please Enter the Last Name");
        return NO;

    }
    else if([self.m_txtEmailAddress.text isEqualToString:@""])
    {
        NSLog(@"Please Enter the Email Address");
        return NO;

    }
    else if([self.m_txtPassword.text isEqualToString:@""])
    {
        NSLog(@"Please Enter the Password");
        return NO;
    }
    else if([self.m_btnDateOfBirth.titleLabel.text isEqualToString:@""])
    {
       NSLog(@"Please Enter the Date of Birth");
        return NO;
    }
    else
    {
        return YES;

    }
}

-(IBAction)onSignUpButtonPressed:(id)sender
{
    NSLog(@"SignInButton Pressed");
    //[self checkValidation];
    
    if([self checkValidation])
    {
        [self userInfo];
    }
    else
    {
        UIActionSheet *actionSheetSign = [[UIActionSheet alloc]initWithTitle:@"Please Enter the all Fields." delegate:self cancelButtonTitle:@"Ok" destructiveButtonTitle:nil otherButtonTitles:nil, nil];
        [actionSheetSign showInView:self.view];
    }

}

-(IBAction)onDoneButtonPressed:(id)sender
{
    NSLog(@"Done Button Pressed");
    self.m_datePicker.hidden = YES;
    self.m_btnDone.hidden = YES;
    
}




@end
