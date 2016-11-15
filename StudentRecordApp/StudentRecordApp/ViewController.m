//
//  ViewController.m
//  StudentRecordApp
//
//  Created by Beryl Systems on 11/11/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        ShowAllStudentViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ShowAllStudentViewController"];
        [self.navigationController pushViewController:detailVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onLoginButtonPressed:(id)sender
{
    NSLog(@"Login button pressed");
    LoginViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self.navigationController pushViewController:detailVC animated:YES];
    
}

-(IBAction)onRegisterButtonPressed:(id)sender
{
    NSLog(@"Register button pressed");
    RegistrationViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"RegistrationViewController"];
    [self.navigationController pushViewController:detailVC animated:YES];

}
@end
