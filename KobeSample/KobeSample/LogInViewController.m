//
//  LogInViewController.m
//  KobeSample
//
//  Created by Beryl Systems on 21/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "LogInViewController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)userLogInInfo
{
    NGAPIClient *client = [NGAPIClient sharedHTTPClient];
    
    [client getUserInfoForLogIn : [self setJsonDataForLogIn] completion:^(NSMutableDictionary *message, NSError *error)
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
             //                 NSLog(@"status %@",status);
             if([status isEqualToString:@"200"] && errorCode.length <= 0 ){
                 NSDictionary *dicUser = [Utility getFormattedValue:[message objectForKey:@"user"]];
                                      NSLog(@"user info is  => %@",dicUser);
                 NSDictionary *dicData = [Utility getFormattedValue:[dicUser objectForKey:@"data"]];
                                      NSLog(@"user data is => %@",dicData);
                 [[NSUserDefaults standardUserDefaults]setObject:dicData forKey:@"userdata"];
                 [[NSUserDefaults standardUserDefaults]synchronize];
                 RootViewController *showallvenuevC = [self.storyboard instantiateViewControllerWithIdentifier:@"rootController"];
                 [self presentViewController:showallvenuevC animated:YES completion:nil];
             }
             else
             {
                 NSLog(@"message from SignUpUserViaFacebook => %@",message);
                 NSString *sMessage = [Utility getFormattedValue:[message objectForKey:@"message"]];
                 UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:[NSString stringWithFormat:@"%@", sMessage] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"ok", nil];
                 [alertView show];
             }
         }
     }];
}


- (NSMutableDictionary *)setJsonDataForLogIn
{
    NSMutableDictionary *dicFinal =[[NSMutableDictionary alloc]init];
    NSMutableDictionary *dicUser =[[NSMutableDictionary alloc]init];
    NSMutableDictionary *dicData = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *dictAttributes = [[NSMutableDictionary alloc]init];
    
    [dictAttributes setObject:self.m_txtEmailAddress.text forKey:@"email"];
    [dictAttributes setObject:self.m_txtPassword.text forKey:@"password"];
    [dictAttributes setObject:@"email" forKey:@"provider"];
    [dicData setObject:dictAttributes forKey:@"attributes"];
    [dicUser setObject:dicData forKey:@"data"];
    [dicFinal setObject:dicUser forKey:@"user"];
    NSLog(@"dicAttribute is => %@",dicFinal);
    return dicFinal;
}

-(IBAction)onLogInButtonPressed:(id)sender
{
    NSLog(@"LogIn button pressed");
    [self userLogInInfo];
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
