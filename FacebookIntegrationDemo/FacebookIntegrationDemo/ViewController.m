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
    self.m_btnFacebook.layer.cornerRadius = 20;
    self.m_btnFacebook.layer.masksToBounds = YES;
    self.m_btnFacebook.clipsToBounds = YES;
    [self fbSample];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)fbSample
{
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
}

-(IBAction)onFacebookButtonPressed:(id)sender
{
    NSLog(@"login with Facebook button is pressed");
    [self getUserInformation];
    
}


-(void)getUserInformation
{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithReadPermissions: @[@"public_profile"]
                            handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                if (error) {
                                    NSLog(@"Process error");
                                } else if (result.isCancelled) {
                                    NSLog(@"Cancelled");
                                } else {
                                    NSLog(@"result:%@", result);
                                    
                                    if ([FBSDKAccessToken currentAccessToken]) {
                                        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
                                         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                                             if (!error) {
                                                 NSLog(@"fetched user:%@", result);
                                                 
                                                 
                                             }
                                         }];
                                    }
                                    NSLog(@"Logged in");
                                }
                            }];
}


@end
