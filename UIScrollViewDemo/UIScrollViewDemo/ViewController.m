//
//  ViewController.m
//  UIScrollViewDemo
//
//  Created by Beryl Systems on 22/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onImageClicked:(id)sender
{
    NSLog(@"Clicked on image");
    //ActionSheet
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"Congratulation" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Select Another Image", nil];
    actionSheet.tag = 100;
    [actionSheet showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(actionSheet.tag == 100)
    {
    if(buttonIndex == 0)
    {
        NSLog(@"Image Selected");
        [self selectImages];
        NSLog(@"finally image uploaded");
        
    }
    else if(buttonIndex == 1)
        NSLog(@"Cancel");
    }
}


#pragma mark
#pragma selectImages method


-(void)selectImages
{
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary])
    {
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        controller.allowsEditing = NO;
        controller.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType: UIImagePickerControllerSourceTypePhotoLibrary];
        controller.delegate = self;
        [self.navigationController presentViewController: controller animated: YES completion: nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *imageSelected = [info valueForKey: UIImagePickerControllerOriginalImage];
    self.m_imageView.image = imageSelected;
    [picker dismissViewControllerAnimated: YES completion: nil];
}


#pragma mark
#pragma setSCrollWhenKeyUp method

-(void)setScrollWhenKeyboardUp
{
    NSLog(@"setScrollWhenKeyUp method is called");

    if([[Utility iPhoneModel]isEqualToString:@"iphone5s"])
    {
        if (!([self.m_txtActive isEqual:self.m_firstName] || [self.m_txtActive isEqual:self.m_lastName] || [self.m_txtActive isEqual:self.m_dob]))
        {
            
            [self.m_scrollView setContentOffset:CGPointMake(0, 151) animated:YES];
        }
        [self.m_scrollView setContentSize:(CGSizeMake(self.m_scrollView.frame.size.width, self.m_scrollView.frame.size.height +201))];
    }
    else if([[Utility iPhoneModel]isEqualToString:@"iphone6"])
    {
        if (!([self.m_txtActive isEqual:self.m_firstName] || [self.m_txtActive isEqual:self.m_lastName] || [self.m_txtActive isEqual:self.m_dob] || [self.m_txtActive isEqual:self.m_emailAddress] || [self.m_txtActive isEqual:self.m_contactNumber]))
        {
           
            [self.m_scrollView setContentOffset:CGPointMake(0, 65) animated:YES];
        }
         [self.m_scrollView setContentSize:(CGSizeMake(self.m_scrollView.frame.size.width, self.m_scrollView.frame.size.height +107))];
    }
    else if([[Utility iPhoneModel]isEqualToString:@"iphone6+"])
    {
        [self.m_scrollView setContentSize:(CGSizeMake(self.m_scrollView.frame.size.width, self.m_scrollView.frame.size.height +50))];
    }
}


#pragma mark
#pragma setSCrollWhenKeyDown method

-(void)setScrollWhenKeyDown
{
    NSLog(@"setScrollWhenKeyDown method is called");
    
    [self.m_scrollView setContentSize:(CGSizeMake(0,0))];
    [self.m_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
}

#pragma mark
#pragma mark - UITextField Delegates

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"beginEditing");
    self.m_txtActive = textField;
    [self setScrollWhenKeyboardUp];

}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"endEditing");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    NSLog(@"retun called");
    [self setScrollWhenKeyDown];
    return YES;
}

#pragma mark
#pragma UIClass Methods

-(void)checkTxtFieldEmpty
{
    self.myBool = NO;
    if([self.m_firstName.text isEqualToString:@""])
    {
        NSLog(@"Please Enter the First Name");
    }else if([self.m_lastName.text isEqualToString:@""])
    {
        NSLog(@"Please Enter the Last Name");
    }else if([self.m_emailAddress.text isEqualToString:@""])
    {
        NSLog(@"Please Enter the Email Address");
    }else if([self.m_contactNumber.text isEqualToString:@""])
    {
        NSLog(@"Please Enter the Contact Number");
    }else if([self.m_dob.text isEqualToString:@""])
    {
        NSLog(@"Please Enter the Date of Birth");
    }else if([self.m_password.text isEqualToString:@""])
    {
        NSLog(@"Please Enter the Password");
    }else if([self.m_rePassword.text isEqualToString:@""])
    {
        NSLog(@"Please Enter the re-Password");
    }else if(![self.m_password.text isEqualToString:self.m_rePassword.text])
    {
        NSLog(@"Please Enter the Same Password");
    }else
        self.myBool = YES;

}
-(IBAction)onSighUpButtonPressed:(id)sender
{
    [self checkTxtFieldEmpty];
    if(self.myBool == YES)
    {
        UIActionSheet *actionSheetSign = [[UIActionSheet alloc]initWithTitle:@"Congratulation Sign Up Completed" delegate:self cancelButtonTitle:@"Ok" destructiveButtonTitle:nil otherButtonTitles:nil, nil];
        [actionSheetSign showInView:self.view];
    }else{
            UIActionSheet *actionSheetSign = [[UIActionSheet alloc]initWithTitle:@"Please Enter the all Fields." delegate:self cancelButtonTitle:@"Ok" destructiveButtonTitle:nil otherButtonTitles:nil, nil];
            [actionSheetSign showInView:self.view];
    }
}


@end
