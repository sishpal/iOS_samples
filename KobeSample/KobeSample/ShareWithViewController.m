//
//  ShareWithViewController.m
//  KobeSample
//
//  Created by Beryl Systems on 17/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "ShareWithViewController.h"

@interface ShareWithViewController ()

@end

@implementation ShareWithViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Share With";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)fbButton
{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *fbSLComposeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        //[fbSLComposeViewController addImage:someImage];
        [fbSLComposeViewController setInitialText:@"Some Text"];
        [self presentViewController:fbSLComposeViewController animated:YES completion:nil];
        
        fbSLComposeViewController.completionHandler = ^(SLComposeViewControllerResult result) {
            switch(result) {
                case SLComposeViewControllerResultCancelled:
                    NSLog(@"facebook: CANCELLED");
                    break;
                case SLComposeViewControllerResultDone:
                    NSLog(@"facebook: SHARED");
                    break;
            }
        };
    }
    else {
        UIAlertView *fbError = [[UIAlertView alloc] initWithTitle:@"Facebook Unavailable" message:@"Sorry, we're unable to find a Facebook account on your device.\nPlease setup an account in your devices settings and try again." delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
        [fbError show];
    }
}


-(void)twitterButton
{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *fbSLComposeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        //[fbSLComposeViewController addImage:someImage];
        [fbSLComposeViewController setInitialText:@"Some Text"];
        [self presentViewController:fbSLComposeViewController animated:YES completion:nil];
        
        fbSLComposeViewController.completionHandler = ^(SLComposeViewControllerResult result) {
            switch(result) {
                case SLComposeViewControllerResultCancelled:
                    NSLog(@"facebook: CANCELLED");
                    break;
                case SLComposeViewControllerResultDone:
                    NSLog(@"facebook: SHARED");
                    break;
            }
        };
    }
    else {
        UIAlertView *fbError = [[UIAlertView alloc] initWithTitle:@"Facebook Unavailable" message:@"Sorry, we're unable to find a Facebook account on your device.\nPlease setup an account in your devices settings and try again." delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
        [fbError show];
    }
}

-(IBAction)onFacebookButtonPressed:(id)sender

{
    NSLog(@"Share With Facebook");
    [self fbButton];
}

-(IBAction)onTwitterButtonPredded:(id)sender
{
    NSLog(@"Share With Twitter");
    [self twitterButton];

}

-(IBAction)onWhatsAppButtonPredded:(id)sender
{
    NSLog(@"Share With whatsApp");
   
}
-(IBAction)onBackButtonPredded:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
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
