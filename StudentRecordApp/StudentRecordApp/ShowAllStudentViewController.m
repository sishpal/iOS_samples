//
//  ShowAllStudentViewController.m
//  StudentRecordApp
//
//  Created by Beryl Systems on 11/11/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "ShowAllStudentViewController.h"

@interface ShowAllStudentViewController ()

@end

@implementation ShowAllStudentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.studentArray = [[NSMutableArray alloc] init];
    [self showData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onBackButtonPressed:(id)sender
{
    NSLog(@"Back Button Pressed");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) showData
{
    [self.studentArray removeAllObjects];
    sqlite3_stmt *statement = nil;
    sqlite3 *database = [DBConnectionManager getDatabaseObject];
    NSString *Query = [NSString stringWithFormat: @"select s_name,roll_no,class,section from student"];
    
    if( sqlite3_prepare_v2(database, [Query UTF8String], -1, &statement, NULL) == SQLITE_OK )
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            studentInfo *data = [[studentInfo alloc] init];
            data.m_Name =[[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 0)];
            data.m_RollNo = [[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 1)];
            data.m_Class = [[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 2)];
            data.m_Section = [[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 3)];
            
            [[NSUserDefaults standardUserDefaults]setObject:self.studentArray forKey:@"student"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            
            [self.studentArray addObject:data];
        }
    }
    else
    {
        
        NSLog( @"Failed from sqlite3_prepare_v2. Error is:  %s", sqlite3_errmsg(database) );
    }
    // Finalize statement.
    
    sqlite3_finalize(statement);
    
    statement = nil;
    [self.tableview reloadData];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.studentArray.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *customCell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    studentInfo *data = (studentInfo *) [self.studentArray objectAtIndex:indexPath.row];

    customCell.m_lblName.text = data.m_Name;
    customCell.m_lblClass.text = data.m_Class;
    return customCell;
    
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
