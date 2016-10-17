//
//  UpdateUserInfoViewController.m
//  KobeSample
//
//  Created by Beryl Systems on 14/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "UpdateUserInfoViewController.h"

@interface UpdateUserInfoViewController ()

@end

@implementation UpdateUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapGesture:)];
//    tapGesture1.numberOfTapsRequired = 1;
    [tapGesture1 setDelegate:self];
    [self.m_imageView addGestureRecognizer:tapGesture1];
    
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    self.m_datePicker.hidden = YES;
    self.m_btnDone.hidden = YES;
    NSMutableDictionary *dictData = [[NSUserDefaults standardUserDefaults]objectForKey:@"userdata"];
    userInfo *info = [[userInfo alloc]initWithData:dictData];
    //[self.arrData addObject:info];
    self.m_firstName.text = info.m_firstName;
    self.m_lastName.text = info.m_lastName;
    self.m_emailAddress.text = info.m_emailAddress;
    [self.m_dateOfBirth setTitle:info.m_dateOfBirth forState:UIControlStateNormal];
    NSLog(@"img url => %@",info.m_image);
    
    [self setCellData:info.m_image];
//    [self.m_imageView setImageWithURL:[NSURL URLWithString: info.m_image] placeholderImage:[UIImage imageNamed:@"download"]];
    
    NSLog(@"image s->%@",info.m_image);
    self.m_imageView.layer.cornerRadius = 40;
    self.m_imageView.layer.masksToBounds = YES;
    self.m_imageView.clipsToBounds = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark
#pragma setJsonFormate for profilrEdit

-(NSMutableDictionary *)setJsonDataForProfileEdit
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSMutableDictionary *dicFinal =[[NSMutableDictionary alloc]init];
    NSMutableDictionary *dicUser = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *dicData = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *dictAttribute = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *dictData = [[NSUserDefaults standardUserDefaults]objectForKey:@"userdata"];
    userInfo *info = [[userInfo alloc]initWithData:dictData];
    self.m_sImgData =  UIImageJPEGRepresentation(self.m_imageView.image, 0.50f);
    NSString *imgString = [Utility base64StringFromData:self.m_sImgData length:(int)self.m_sImgData.length];
    NSString *fname = self.m_firstName.text;
    NSLog(@"name is ==>%@",fname);
    NSString *firstName = self.m_firstName.text;
    NSString *lastName = self.m_lastName.text;
    NSString *emailAddress = self.m_emailAddress.text;
    NSString *dateOfBirth = self.m_dateOfBirth.titleLabel.text;
    NSLog(@"dob is %@",dateOfBirth);
    [dictAttribute setObject:dateOfBirth forKey:@"date_of_birth"];
    [dictAttribute setObject:firstName forKey:@"first_name"];
    [dictAttribute setObject:lastName forKey:@"last_name"];
    [dictAttribute setObject:emailAddress forKey:@"email"];
    [dictAttribute setObject:imgString forKey:@"image"];
    [dicData setObject:dictAttribute forKey:@"attributes"];
    [dicData setObject:info.m_id forKey:@"id"];
    [dicUser setObject:dicData forKey:@"data"];
    [dicFinal setObject:dicUser forKey:@"user"];
    return dicFinal;
}

-(void)profileEdit
{
    NGAPIClient *client = [NGAPIClient sharedHTTPClient];
    [client profileEdit : [self setJsonDataForProfileEdit] completion:^(NSMutableDictionary *message, NSError *error)
     {
         if(error)
         {
             NSLog(@"Something bad happend. Please try again.");
             [MBProgressHUD hideHUDForView:self.view animated:YES];
             
         }
         else
         {
             [MBProgressHUD hideHUDForView:self.view animated:YES];
             NSLog(@" profile Edit is message is => %@",message);
             NSString *status =  [Utility  getFormattedValue:[message objectForKey:@"status"]];
             NSString *errorCode =  [Utility  getFormattedValue:[message objectForKey:@"error_code"]];
             NSLog(@"error code is => %@",errorCode);
             NSLog(@"status %@",status);
             
             NSMutableDictionary *dicUser = [Utility getFormattedValue:[message objectForKey:@"user"]];
             NSLog(@"data is=> %@",dicUser);
     
             
             NSDictionary *dicData = [Utility getFormattedValue:[dicUser objectForKey:@"data"]];
             NSLog(@"user data is => %@",dicData);
             
             [[NSUserDefaults standardUserDefaults]setObject:dicData forKey:@"userdata"];
             [[NSUserDefaults standardUserDefaults]synchronize];
             
             
         }
     }];
}

- (void) tapGesture: (id)sender
{
    [self selectImages];
}

-(IBAction)onEditButtonPressed:(id)sender
{
    [self selectImages];
}
-(IBAction)onDateofBirthButtonPressed:(id)sender
{
    self.m_datePicker.hidden = NO;
    self.m_datePicker.backgroundColor = [UIColor lightGrayColor];
    self.m_btnDone.backgroundColor = [UIColor lightGrayColor];
    self.m_btnDone.hidden = NO;
    NSLog(@"Pressed selectedDate");
    NSDate *date = [self.m_datePicker date];
    NSLog(@"date is -> %@",date);
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
    NSString *outputString = [formatter stringFromDate:date];
    NSLog(@"new formate of date is => %@",outputString);
    [self.m_dateOfBirth setTitle:[NSString stringWithFormat:@"%@",outputString] forState:UIControlStateNormal];
    
}

-(IBAction)onCancelButtonPressed:(id)sender
{
    NSLog(@"Search button pressed");
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


-(IBAction)onDoneButtonPressed:(id)sender
{
    NSLog(@"Done Button Pressed");
    self.m_datePicker.hidden = YES;
    self.m_btnDone.hidden = YES;
    
}

#pragma mark
#pragma setSCrollWhenKeyUp method

-(void)setScrollWhenKeyboardUp
{
    NSLog(@"setScrollWhenKeyUp method is called");
    //    self.m_datePicker.hidden = YES;
    if([[Utility iPhoneModel]isEqualToString:@"iphone5s"])
    {
        if (!([self.m_txtActive isEqual:self.m_firstName] || [self.m_txtActive isEqual:self.m_lastName]))
        {
            
            [self.m_scrollView setContentOffset:CGPointMake(0, 115) animated:YES];
        }
        [self.m_scrollView setContentSize:(CGSizeMake(self.m_scrollView.frame.size.width, self.m_scrollView.frame.size.height +187))];
    }
    else if([[Utility iPhoneModel]isEqualToString:@"iphone6"])
    {
        if (![self.m_txtActive isEqual:self.m_firstName])
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
-(IBAction)onupdateButtonPressed:(id)sender
{
    [self profileEdit];

}



#pragma mark
#pragma imagepicker method


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

#pragma mark
#pragma imagepicker delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    
    UIImage *imageSelected = [info valueForKey: UIImagePickerControllerOriginalImage];
    self.m_imageView.image = imageSelected;
    [picker dismissViewControllerAnimated: YES completion: nil];
}
-(IBAction)onImageClicked:(id)sender
{
    [self selectImages];
}

- (void)setCellData : (NSString *)sUrl
{
    if([sUrl isEqualToString:@""] || sUrl == nil)
    {
        [self.activityIndicator setHidden:YES];
        [self.activityIndicator stopAnimating];
    }
    else
    {
        [self.activityIndicator setHidden:NO];
        [self.activityIndicator startAnimating];
        [NSThread detachNewThreadSelector:@selector(downloadImageFromUrl:) toTarget:self withObject:sUrl];
    }
}

- (void)downloadImageFromUrl:(NSString *)sUrl
{
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:sUrl]];
    
    if(data)
    {
        UIImage *image = [UIImage imageWithData:data];
        //        [[ImageCache sharedImageCache] storeImage:image forUrl:self.imageURL];
        //[[ImageCache sharedImageCache] AddImage:sUrl :image];
        [self performSelectorOnMainThread:@selector(imageDownloadingPerformed:) withObject:image waitUntilDone:YES];
    }
}
- (void)imageDownloadingPerformed:(UIImage *)image
{
    [self.activityIndicator stopAnimating];
    [self.activityIndicator setHidden:YES];
    [self.m_imageView setImage:image];
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
