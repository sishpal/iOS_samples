//
//  UpdateUserInfoViewController.m
//  KobeSample
//
//  Created by Beryl Systems on 14/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "UpdateUserInfoViewController.h"

@interface UpdateUserInfoViewController ()

@end

@implementation UpdateUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    self.m_datePicker.hidden = YES;
    self.m_btnDone.hidden = YES;
    NSLog(@"Selected first name is => %@",self.data.m_firstName);
    NSLog(@"Selected last name is => %@",self.data.m_lastName);
    NSLog(@"Selected Email Address is => %@",self.data.m_emailAddress);
    NSLog(@"Selected Date of birth is => %@",self.data.m_dateOfBirth);
    self.m_firstName.text = self.data.m_firstName;
    self.m_lastName.text = self.data.m_lastName;
    self.m_emailAddress.text = self.data.m_emailAddress;
    NSLog(@"dob is => %@",_data.m_dateOfBirth);
    [self.m_dateOfBirth setTitle:self.data.m_dateOfBirth forState:UIControlStateNormal];
//    self.m_image.layer.cornerRadius = 125;
//    self.m_image.layer.masksToBounds = YES;
//    self.m_image.clipsToBounds = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark
#pragma setJsonFormate for profilrEdit

-(NSMutableDictionary *)setJsonDataForProfileEdit
{
    NSMutableDictionary *dicFinal =[[NSMutableDictionary alloc]init];
    NSMutableDictionary *dicUser = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *dicData = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *dictAttribute = [[NSMutableDictionary alloc]init];
    NSString *firstName = self.data.m_firstName;
    NSString *lastName = self.data.m_lastName;
    NSString *emailAddress = self.data.m_emailAddress;
    NSString *dateOfBirth = self.data.m_dateOfBirth;
    NSMutableDictionary *dicMessage = [[NSUserDefaults standardUserDefaults]objectForKey:@"userdata"];
    userInfo *objUserInfo = [[userInfo alloc]initWithData:dicMessage];
    NSLog(@"objUserInfo is => %@",objUserInfo.m_id);
    [dictAttribute setObject:dateOfBirth forKey:@"date_of_birth"];
    [dictAttribute setObject:firstName forKey:@"first_name"];
    [dictAttribute setObject:lastName forKey:@"last_name"];
    [dictAttribute setObject:emailAddress forKey:@"email"];
    [dicData setObject:dictAttribute forKey:@"attributes"];
    [dicData setObject:objUserInfo.m_id forKey:@"id"];
    [dicUser setObject:dicData forKey:@"data"];
    [dicFinal setObject:dicUser forKey:@"user"];
    return dicFinal;
}

-(void)profileEdit
{
    NGAPIClient *client = [NGAPIClient sharedHTTPClient];
    [client profileEdit : [self setJsonDataForProfileEdit] completion:^(NSMutableDictionary *message, NSError *error)
     {
         if(error)
         {
             NSLog(@"Something bad happend. Please try again.");
             [MBProgressHUD hideHUDForView:self.view animated:YES];
             
         }
         else
         {
             [MBProgressHUD hideHUDForView:self.view animated:YES];
             NSLog(@" profile Edit is message is => %@",message);
             NSString *status =  [Utility  getFormattedValue:[message objectForKey:@"status"]];
             NSString *errorCode =  [Utility  getFormattedValue:[message objectForKey:@"error_code"]];
             NSLog(@"error code is => %@",errorCode);
             NSLog(@"status %@",status);
         }
     }];
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
    [self.m_dateOfBirth setTitle:[NSString stringWithFormat:@"%@",outputString] forState:UIControlStateNormal];
    
}

-(IBAction)onCancelButtonPressed:(id)sender
{
    NSLog(@"Search button pressed");
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


-(IBAction)onDoneButtonPressed:(id)sender
{
    NSLog(@"Done Button Pressed");
    self.m_datePicker.hidden = YES;
    self.m_btnDone.hidden = YES;
    
}

#pragma mark
#pragma setSCrollWhenKeyUp method

-(void)setScrollWhenKeyboardUp
{
    NSLog(@"setScrollWhenKeyUp method is called");
    //    self.m_datePicker.hidden = YES;
    if([[Utility iPhoneModel]isEqualToString:@"iphone5s"])
    {
        if (!([self.m_txtActive isEqual:self.m_firstName] || [self.m_txtActive isEqual:self.m_lastName]))
        {
            
            [self.m_scrollView setContentOffset:CGPointMake(0, 115) animated:YES];
        }
        [self.m_scrollView setContentSize:(CGSizeMake(self.m_scrollView.frame.size.width, self.m_scrollView.frame.size.height +187))];
    }
    else if([[Utility iPhoneModel]isEqualToString:@"iphone6"])
    {
        if (![self.m_txtActive isEqual:self.m_firstName])
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
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    NSLog(@"retun called");
    [self setScrollWhenKeyDown];
    return YES;
}
-(IBAction)onupdateButtonPressed:(id)sender
{
    [self profileEdit];

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
