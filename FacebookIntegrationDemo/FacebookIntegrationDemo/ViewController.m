//
//  ViewController.m
//  FacebookIntegrationDemo
//
//  Created by Beryl Systems on 18/10/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dicFacebookInfo =[[NSMutableDictionary alloc]init];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)fbSample
{
    NSArray *permissions = nil;
    if ([FBSDKAccessToken currentAccessToken].declinedPermissions.count > 0) {
        permissions = [FBSDKAccessToken currentAccessToken].declinedPermissions.allObjects;
    } else {
        permissions = @[@"email", @"public_profile", @"user_birthday"];
    }
    FBSDKLoginManager *fbsdkLoginManager = [[FBSDKLoginManager alloc] init];
    [fbsdkLoginManager logOut];
    [fbsdkLoginManager logInWithReadPermissions:permissions fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error)
     {
         NSLog(@"error is => %@",error);
         if (error) {
             NSLog(@"ero is %@",error);
         } else if (result.isCancelled) {
             UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Login Failure" message:@"Kobe needs permission to your Facebook public profile and email address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
             [alertView show];
         } else {
                [self getFaceBookData];
                NSString *access_token = [[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"];
                NSLog(@"access is -> %@",access_token);
                [self getFacebookInfoFromGraphAPI:access_token];
         }
     }];
}


-(IBAction)onFacebookButtonPressed:(id)sender
{
    NSLog(@"login with Facebook button is pressed");
    [self fbSample];
}


- (void)getFacebookInfoFromGraphAPI : (NSString *)accessToken //: (CompletionBlock)completion
{
    // [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NGAPIClient *client = [NGAPIClient sharedHTTPClient];
    [client getFaceBookInfoFromGraphAPI:accessToken completion:^(NSMutableDictionary *message, NSError *error)
     {
         if(error)
         {
             [MBProgressHUD hideHUDForView:self.view animated:YES];
             [Utility showAlertWithTitle:@"Oops" withMessage:@"Something bad happened. Please try again."];
         }
         else
         {
             [MBProgressHUD hideHUDForView:self.view animated:YES];
             if([message objectForKey:@"errors"])
             {
                 [Utility showAlertWithTitle:kAppName withMessage:[message objectForKey:@"errors"]];
             }
             else
             {
                 self.faceBookInfo = [[FacebookInfo alloc]initwithFacebookInfo:message];
                 self.faceBookInfo.m_sAccessToken = [FBSDKAccessToken currentAccessToken].tokenString;
                 self.sIsProvider = @"facebook";
             }
             NSLog(@"message by graphics API %@",message);
             self.dicFacebookInfo = message;

         }
     }];
}


- (void)getFaceBookData //: (CompletionBlock)completion
{
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
                 [self facebookAccountVerification :fb_id];
             }
             else
             {
                 [MBProgressHUD hideHUDForView:self.view animated:YES];
             }
         }];
    }
}


-(void)facebookAccountVerification:(NSString *)fb_id
{
    NGAPIClient *client = [NGAPIClient sharedHTTPClient];
    [client facebookAccountVerification : fb_id completion:^(NSMutableDictionary *message, NSError *error)
     {
         if(error)
         {
             NSLog(@"Something bad happend. Please try again.");
             NSLog(@"error iis => %@",error);
             [MBProgressHUD hideHUDForView:self.view animated:YES];
         }
         else
         {
             [MBProgressHUD hideHUDForView:self.view animated:YES];
             NSLog(@"message from facebookAccountVerification => %@",message);
             
             NSString *sStatus = [Utility getFormattedValue:[message objectForKey:@"status"]];
             NSString *sErrorCode = [Utility getFormattedValue:[message objectForKey:@"error_code"]];
             if([sStatus isEqualToString:@"200"] && sErrorCode.length >= 0)
             {
                 [self SignUpUserViaFacebook];
             }
         }
     }];
}


-(NSMutableDictionary *)setJsonDataForSignUpUserViaFacebook
{
    NSMutableDictionary *dicFinal =[[NSMutableDictionary alloc]init];
    NSMutableDictionary *dicUser =[[NSMutableDictionary alloc]init];
    NSMutableDictionary *dicData = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *dictAttributes = [[NSMutableDictionary alloc]init];
    
    NSLog(@"userinfo from facebook==%@",self.dicFacebookInfo);
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

-(void)SignUpUserViaFacebook
{
    NGAPIClient *client = [NGAPIClient sharedHTTPClient];
    [client SignUpUserViaFacebook : [self setJsonDataForSignUpUserViaFacebook] completion:^(NSMutableDictionary *message, NSError *error)
     {
         if(error)
         {
             NSLog(@"Something bad happend. Please try again.");
             NSLog(@"errors => %@",error);
             [MBProgressHUD hideHUDForView:self.view animated:YES];
         }
         else
         {
             [MBProgressHUD hideHUDForView:self.view animated:YES];
             NSLog(@"message from SignUpUserViaFacebook => %@",message);
         }
     }];

}
@end
