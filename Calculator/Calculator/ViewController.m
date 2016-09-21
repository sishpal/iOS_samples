//
//  ViewController.m
//  Calculator
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
    self.m_number1.text = nil;
    self.m_number2.text = nil;
    self.navigationController.navigationBar.translucent = NO;

}

#pragma mark
#pragma mark - UIControl Methods

-(IBAction)onSubmitButtonPressed:(id)sender
{
    NSLog(@"Submit button is pressed");
        if([self.m_number1.text isEqualToString:@""])
        {
            NSLog(@"Please Enter the first number");
            self.m_lbSum.text = nil;

        }else if([self.m_number2.text isEqualToString:@""])
        {
            NSLog(@"Please enter the second number");
            self.m_lbSum.text = nil;

        }else
        {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:@"What you want to do with these values" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Sum", @"Minus",@"Multiply", @"Divide", nil];
            [alertView show];
        }
     [self.m_number1 resignFirstResponder];
     [self.m_number2 resignFirstResponder];

    
    
}


#pragma mark
#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    float value1 = [self.m_number1.text floatValue];
    float value2 = [self.m_number2.text floatValue];
    float sum = value1 + value2;
    float minus = value1 - value2;
    float multiply = value1 * value2;
    float divide = value1 / value2;
    if(buttonIndex == 0)
    {
        NSLog(@"Cancel");
        self.m_number1.text = nil;
        self.m_number2.text = nil;
        self.m_lbSum.text = nil;
        
        
    }
    else if(buttonIndex == 1)
    {
        NSLog(@"Sum Calculated");
        self.m_lbSum.text = [NSString stringWithFormat:@"%.3f",sum];
    }else if(buttonIndex == 2)
    {
        NSLog(@"Difference calculated");
    self.m_lbSum.text = [NSString stringWithFormat:@"%.3f",minus];
    }
    else if(buttonIndex == 3)
    {
        NSLog(@"Multiplication calculated");
    self.m_lbSum.text = [NSString stringWithFormat:@"%.3f",multiply];
    }
    else if(buttonIndex == 4)
    {
        NSLog(@"Division calculated");
        self.m_lbSum.text = [NSString stringWithFormat:@"%.3f",divide];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark
#pragma mark - UITextField Delegates

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)onNextButtonPressed:(id)sender
{
    NSLog(@"Next button pressed");
    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    [self.navigationController pushViewController:detailVC animated:YES];
    
}




@end
