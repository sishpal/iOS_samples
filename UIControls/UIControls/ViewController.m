//
//  ViewController.m
//  UIControls
//
//  Created by Beryl Systems on 14/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.my_lb.text = @"Manan";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark - UIControl Methods

- (IBAction)onPushButtonPressed:(id)sender
{
    NSLog(@"Button pressed");
    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    [self.navigationController pushViewController:detailVC animated:YES];
    
}

#pragma mark
#pragma mark - UIControl Methods

- (IBAction)onAlertButtonPressed:(id)sender
{
    //UIAlerView
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Congratulation" message:@"I am back" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", @"Hello",nil];
    [alertView show];

}

#pragma mark
#pragma mark - UIControl Methods

-(IBAction)sliderValueChanged:(id)sender
{

    NSLog(@"slider method run");
    //self.my_lb.text = [NSString stringWithFormat:@"%f", self.slider.value];


}

#pragma mark
#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0)
    {
        NSLog(@"Cancel");
    }
    else
    {
        NSLog(@"Ok");
    }
}


@end
