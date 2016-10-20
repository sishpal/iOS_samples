//
//  ViewController.m
//  KobeSample
//
//  Created by Prashant Aggarwal on 10/1/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setHidesBackButton:YES];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.translucent = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onRegisterButtonPressed:(id)sender
{
    NSLog(@"Register button pressed and Push on ShowlAllVenuesViewController");
    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    [self.navigationController pushViewController:detailVC animated:YES];
}
-(IBAction)onSignInButtonPressed:(id)sender
{
    NSLog(@"Sign In button pressed");

}

@end
