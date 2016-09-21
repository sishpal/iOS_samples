//
//  DetailViewController.m
//  employeeData
//
//  Created by Beryl Systems on 17/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "DetailViewController.h"
#import "DBConnectionManager.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%@",self.datainfo.empName);
    self.m_txtfEmpName.text = self.datainfo.empName;
    self.m_txtfEmpAddr.text = self.datainfo.empAddress;
    self.m_txtfEmpId.text = self.datainfo.empId;

     if(_myBool == YES)
    {
        //self.m_btnsaveupdate = @"SAVE";
        [self.m_btnsaveupdate setTitle:@"Save" forState:UIControlStateNormal];
    }
    else
    {
        [self.m_btnsaveupdate setTitle:@"Update" forState:UIControlStateNormal];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)saveData
{
    sqlite3_stmt *statement = nil;
    sqlite3 *database = [DBConnectionManager getDatabaseObject];
            NSString *query = [NSString stringWithFormat:@"insert into emp (name,address,id) values('%@','%@','%@')",_m_txtfEmpName.text, _m_txtfEmpAddr.text, _m_txtfEmpId.text];
        if( sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, NULL) == SQLITE_OK )
        {
            if( sqlite3_step(statement) == SQLITE_DONE )
                NSLog(@"Sucessfully Submitted");
        }
        else
            NSLog( @"Failed from sqlite3_prepare_v2. Error is:  %s", sqlite3_errmsg(database) );
    // Finalize statement.
    sqlite3_finalize(statement);
    statement = nil;
}



- (void)updateData
{
    sqlite3_stmt *statement = nil;
    sqlite3 *database = [DBConnectionManager getDatabaseObject];
    NSString *query = [NSString stringWithFormat:@"update emp set name = '%@',address = '%@',id = '%@' where pid='%@'",_m_txtfEmpName.text, _m_txtfEmpAddr.text, _m_txtfEmpId.text,_datainfo.pId];
    if( sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, NULL) == SQLITE_OK )
    {
        if( sqlite3_step(statement) == SQLITE_DONE )
            NSLog(@"Sucessfully Submitted");
    }
    else
        NSLog( @"Failed from sqlite3_prepare_v2. Error is:  %s", sqlite3_errmsg(database) );
    // Finalize statement.
    sqlite3_finalize(statement);
    statement = nil;
}




-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)onSaveButtonPressed:(id)sender
{
    NSLog(@"Save button pressed");
    if([self.m_txtfEmpName.text isEqualToString:@""])
    {
        NSLog(@"Please Enter the Employee Name");
    }else if([self.m_txtfEmpAddr.text isEqualToString:@""])
    {
        NSLog(@"Please Enter the Employee Address");
    }else if([self.m_txtfEmpId.text isEqualToString:@""])
    {
        NSLog(@"Please Enter the Employee Id");
    }
    else if(_myBool == YES)
    {
        //self.m_btnsaveupdate = @"SAVE";
        [self saveData];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        [self updateData];
        //self.m_btnsaveupdate = @"UPDATE";
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark
#pragma actionSheet

-(IBAction)onUploadButtonPressed:(id)sender
{
    NSLog(@"Upload Button is Pressed");
        //ActionSheet
        UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"Congratulation" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Upload Image", nil];
        [actionSheet showInView:self.view];
    
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0)
    {
        NSLog(@"Upload Image");
        [self chooseImages];
       // self.m_imageView.image = [UIImage imageNamed:@"th.jpeg"];
        NSLog(@"finally image uploaded");

    }
        else if(buttonIndex == 1)
            NSLog(@"Cancel");
}


#pragma mark
#pragma ChooseImages method


-(void)chooseImages
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




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
