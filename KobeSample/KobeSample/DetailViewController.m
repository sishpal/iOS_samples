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

     //[self userInfo];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma Method

-(void)userInfo
{
    NSMutableDictionary *dicData = [NSMutableDictionary new];
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

    }
     }];
}

//- (NSMutableDictionary *)setJsonData
//{
//    NSMutableArray *dicData = [[NSMutableDictionary alloc]init];
//    [dicData]
//    NSMutableDictionary *dictAttribute = [[NSMutableDictionary alloc]init];
//    [dictAttribute setObject:self.m_txtFirstName forKey:@"first_name"];
//    [dictAttribute setObject:self.m_txtFirstName forKey:@"last_name"];
//    [dictAttribute setObject:self.m_txtFirstName forKey:@"email"];
//    [dictAttribute setObject:self.m_txtFirstName forKey:@"password"];
//    [dictAttribute setObject:self.m_txtFirstName forKey:@"date_of_birth"];
//
//
//
//    
//
//    return dicData;
//
//
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark
#pragma setSCrollWhenKeyUp method

-(void)setScrollWhenKeyboardUp
{
    NSLog(@"setScrollWhenKeyUp method is called");
    
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
    NSLog(@"Pressed selectedDate");
    NSDate *date = [self.m_datePicker date];
    NSLog(@"date is -> %@",date);
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    //NSData *today = @"2016-09-21";
    //[self.m_datePicker setMaximumDate:today];
    
    NSString *outputString = [formatter stringFromDate:date];
    NSLog(@"new formate of date is => %@",outputString);
    self.m_btnDateOfBirth.titleLabel.text = [NSString stringWithFormat:@"%@",outputString];



}




@end
