//
//  DetailViewController.m
//  UIControls
//
//  Created by Beryl Systems on 14/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.m_lblName.text = @"Sishpal";
    self.name_lblName.text = @"Manan";
    self.name_tfName.text = @"Enter text";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark - UIControl Methods

-(IBAction)onPopButtonPressed:(id)sender
{
    NSLog(@"Pop button pressed");
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark
#pragma mark - UITextfield delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"hello");
}

@end
