//
//  ViewController.m
//  imageView
//
//  Created by Beryl Systems on 15/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark - Image1Button

- (IBAction)onImage1ButtonPressed:(id)sender
{
    NSLog(@"Image1  button pressed");
    self.m_imageView.image = [UIImage imageNamed:@"lion_PNG566.png"];
}

#pragma mark
#pragma mark - Image2Button

- (IBAction)onImage2ButtonPressed:(id)sender
{
    NSLog(@"Image2  button pressed");
    self.m_imageView.image = [UIImage imageNamed:@"th.jpeg"];
}

#pragma mark
#pragma mark - Image3Button

- (IBAction)onImage3ButtonPressed:(id)sender
{
    NSLog(@"Image3  button pressed");
    self.m_imageView.image = [UIImage imageNamed:@"os-x-lion1.jpg"];
}

#pragma mark
#pragma mark - UIAlertView

- (IBAction)onChangeColorButtonPressed:(id)sender
{
    NSLog(@"Change Color button pressed");
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:@"Please select the color" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Red", @"Blue", @"Green",@"Yellow",@"Brown", nil];
    [alertView show];
}

#pragma mark
#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 4)
    {
        NSLog(@"BROWN Color is selected");
        self.m_txtfColor.backgroundColor = [UIColor brownColor];
        self.m_lbColor.backgroundColor = [UIColor brownColor];
    }else if(buttonIndex == 0)
    {
        NSLog(@"RED Color is selected");
        //[self.m_lbColor.backgroundColor red];
        self.m_lbColor.backgroundColor = [UIColor redColor];
        self.m_txtfColor.backgroundColor = [UIColor redColor];
    }else if(buttonIndex == 1)
    {
        NSLog(@"BLUE Color is selected");
        self.m_lbColor.backgroundColor = [UIColor blueColor];
        self.m_txtfColor.backgroundColor = [UIColor blueColor];

    }else if(buttonIndex == 2)
    {
        NSLog(@"GREEN Color is selected");
        self.m_lbColor.backgroundColor = [UIColor greenColor];
        self.m_txtfColor.backgroundColor = [UIColor greenColor];

    }else if(buttonIndex == 3)
    {
        NSLog(@"YELLOW Color is selected");
        self.m_lbColor.backgroundColor = [UIColor yellowColor];
        self.m_txtfColor.backgroundColor = [UIColor yellowColor];
    }
    
}
#pragma mark
#pragma mark - UITextField Delegates

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
