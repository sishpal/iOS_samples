//
//  RegistrationViewController.m
//  StudentRecordApp
//
//  Created by Beryl Systems on 11/11/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "RegistrationViewController.h"

@interface RegistrationViewController ()

@end

@implementation RegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    self.m_txtName.text = self.StudentEdit.m_Name;
    self.m_txtrollNo.text = self.StudentEdit.m_RollNo;
    self.m_txtClass.text = self.StudentEdit.m_Class;
    self.m_txtSection.text = self.StudentEdit.m_Section;
    if(_myBool == YES)
    {
        [self.btnRegister setTitle:@"Update" forState:UIControlStateNormal];
    }
    else
    {
        [self.btnRegister setTitle:@"Register" forState:UIControlStateNormal];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark
#pragma setSCrollWhenKeyUp method

-(void)setScrollWhenKeyboardUp
{

    if([[Utility iPhoneModel]isEqualToString:@"iphone5s"]) {
        if (![self.m_txtActive isEqual:self.m_txtName]) {
            [self.m_scrollView setContentOffset:CGPointMake(0, 196) animated:YES];
        }
        [self.m_scrollView setContentSize:(CGSizeMake(self.m_scrollView.frame.size.width, self.m_scrollView.frame.size.height +251))];
    }
    else if([[Utility iPhoneModel]isEqualToString:@"iphone6"]) {
        if(!([self.m_txtActive isEqual:self.m_txtName] || [self.m_txtActive isEqual:self.m_txtrollNo])) {
            [self.m_scrollView setContentOffset:CGPointMake(0, 160) animated:YES];
        }
        [self.m_scrollView setContentSize:(CGSizeMake(self.m_scrollView.frame.size.width, self.m_scrollView.frame.size.height +160))];
    }
}

-(void)setScrollWhenKeyDown {
    NSLog(@"setScrollWhenJeyboardDown method called");
    [self.m_scrollView setContentSize:(CGSizeMake(0,0))];
    [self.m_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    self.m_txtActive = textField;
    [self setScrollWhenKeyboardUp];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self setScrollWhenKeyDown];
    return YES;
    
}


- (void)saveData
{
    sqlite3_stmt *statement = nil;
    sqlite3 *database = [DBConnectionManager getDatabaseObject];
    NSString *query = [NSString stringWithFormat:@"insert into student (s_name,roll_no,class,section) values('%@','%@','%@','%@')",_m_txtName.text, _m_txtrollNo.text, _m_txtClass.text,_m_txtSection.text];
    if( sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, NULL) == SQLITE_OK )
    {
        if( sqlite3_step(statement) == SQLITE_DONE )
            NSLog(@"Sucessfully Submitted");
        NSString *yes = @"1";

    }
    else
        NSLog( @"Failed from sqlite3_prepare_v2. Error is:  %s", sqlite3_errmsg(database) );
    sqlite3_finalize(statement);
    statement = nil;
}

- (void)EditRecord
{
    sqlite3_stmt *statement = nil;
    sqlite3 *database = [DBConnectionManager getDatabaseObject];
    NSString *query = [NSString stringWithFormat:@"update student set s_name = '%@',roll_no = '%@',class = '%@', section = '%@' where roll_no='%@'",_m_txtName.text, _m_txtrollNo.text, _m_txtClass.text,_m_txtSection.text,_StudentEdit.m_RollNo];
    if( sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, NULL) == SQLITE_OK )
    {
        if( sqlite3_step(statement) == SQLITE_DONE )
            NSLog(@"Sucessfully Updated");
    }
    else
        NSLog( @"Failed from sqlite3_prepare_v2. Error is:  %s", sqlite3_errmsg(database) );
    // Finalize statement.
    sqlite3_finalize(statement);
    statement = nil;
}


-(IBAction)onBackButtonPressed:(id)sender
{
    NSLog(@"Back Button Pressed");
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)onSubmitButtonPressed:(id)sender
{
    NSLog(@"Submit Button Pressed");
    if([self.m_txtName.text isEqualToString:@""])
    {
        NSLog(@"Please Enter the Name");
    }else if([self.m_txtrollNo.text isEqualToString:@""])
    {
        NSLog(@"Please Enter the Roll Number");
    }else if([self.m_txtClass.text isEqualToString:@""])
    {
        NSLog(@"Please Enter the Class");
    }
    else if([self.m_txtSection.text isEqualToString:@""])
    {
        NSLog(@"Please Enter the Section");
    }
    else if(_myBool == YES)
    {
        [self EditRecord];
        ShowAllStudentViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ShowAllStudentViewController"];
        [self.navigationController pushViewController:detailVC animated:YES];
    }
    else
    {
        [self saveData];
        ShowAllStudentViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ShowAllStudentViewController"];
        [self.navigationController pushViewController:detailVC animated:YES];
    }
}
@end
