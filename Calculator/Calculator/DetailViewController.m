//
//  DetailViewController.m
//  Calculator
//
//  Created by Beryl Systems on 14/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailsViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark
#pragma mark - UIControl Methods

-(IBAction)onSwitchButtonPressed:(id)sender
{
    UISwitch *btnSwitch = (UISwitch *)sender;
    if(btnSwitch.on)
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:@"Switch on" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"ok", nil];
        [alertView show];
        
    }else
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:@"Switch off" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"ok", nil];
        [alertView show];
        
    }
    
    
    
}
-(IBAction)onSliderValueChanged:(id)sender
{

    NSLog(@"slider dragged");
    self.m_lbsliderValue.text = [NSString stringWithFormat:@"%f", self.m_slider.value];
}
-(IBAction)onSubmitButtonPressed:(id)sender
{
    float value = [self.m_tfslidervalue.text floatValue];
    NSLog(@"value is %f",value);
    if(value <= 10 && value >= 0)
    {
        self.m_lbsliderValue.text = [NSString stringWithFormat:@"%f", value];
        [self.m_slider setValue:value animated:YES];
    }
    else
        NSLog(@"please enter vlaue 0 to 10 only");
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    float value = [string floatValue];
    NSLog(@"value is %f",value);
    if(value <= 10 && value >= 0)
    {
        self.m_lbsliderValue.text = [NSString stringWithFormat:@"%f", value];
        [self.m_slider setValue:value animated:YES];
    }
    else
        NSLog(@"please enter vlaue 0 to 10 only");
    return YES;
}
-(IBAction)onActionSheetButtonPressed:(id)sender
{
    
    //ActionSheet
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"Congratulation" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"OK",@"Hello", nil];
    [actionSheet showInView:self.view];

}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0)
        NSLog(@"Ok");
    else if(buttonIndex == 1)
        NSLog(@"Hello");
    else if(buttonIndex == 2)
        NSLog(@"Cancel");
}


#pragma mark
#pragma mark - UITextField Delegates


- (IBAction)onNextButtonPressed:(id)sender
{
    NSLog(@"Next button pressed");
    DetailsViewController *detailsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
    
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:detailsVC];
    [self.navigationController presentViewController:navigationController animated:YES completion:nil];
    
}


@end
