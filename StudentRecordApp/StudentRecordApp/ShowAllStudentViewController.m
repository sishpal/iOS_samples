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
    self.studentLikedArray = [[NSMutableArray alloc] init];
    self.tableSortBy.hidden = YES;
    self.navigationController.navigationBar.translucent = NO;
    [self showData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark
#pragma mark - UIClass Methods

- (void) showData
{
    [self.studentArray removeAllObjects];
    sqlite3_stmt *statement = nil;
    sqlite3 *database = [DBConnectionManager getDatabaseObject];
    NSString *Query = [NSString stringWithFormat: @"select s_name,roll_no,class,section,s_id from student"];
    
    if( sqlite3_prepare_v2(database, [Query UTF8String], -1, &statement, NULL) == SQLITE_OK )
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            studentInfo *data = [[studentInfo alloc] init];
            data.m_Name =[[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 0)];
            data.m_RollNo = [[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 1)];
            data.m_Class = [[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 2)];
            data.m_Section = [[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 3)];
//            data.m_id = +1;
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


- (void) SortByNameASC
{
    [self.studentArray removeAllObjects];
    sqlite3_stmt *statement = nil;
    sqlite3 *database = [DBConnectionManager getDatabaseObject];
    NSString *Query = [NSString stringWithFormat: @"select s_name,roll_no,class,section,s_id from student order by s_name ASC"];
    
    if( sqlite3_prepare_v2(database, [Query UTF8String], -1, &statement, NULL) == SQLITE_OK )
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            studentInfo *data = [[studentInfo alloc] init];
            data.m_Name =[[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 0)];
            data.m_RollNo = [[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 1)];
            data.m_Class = [[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 2)];
            data.m_Section = [[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 3)];
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


- (void) SortByNameDESC
{
    [self.studentArray removeAllObjects];
    sqlite3_stmt *statement = nil;
    sqlite3 *database = [DBConnectionManager getDatabaseObject];
    NSString *Query = [NSString stringWithFormat: @"select s_name,roll_no,class,section,s_id from student order by s_name DESC"];
    
    if( sqlite3_prepare_v2(database, [Query UTF8String], -1, &statement, NULL) == SQLITE_OK )
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            studentInfo *data = [[studentInfo alloc] init];
            data.m_Name =[[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 0)];
            data.m_RollNo = [[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 1)];
            data.m_Class = [[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 2)];
            data.m_Section = [[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 3)];
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


- (void) SortByClassASC
{
    [self.studentArray removeAllObjects];
    sqlite3_stmt *statement = nil;
    sqlite3 *database = [DBConnectionManager getDatabaseObject];
    NSString *Query = [NSString stringWithFormat: @"select s_name,roll_no,class,section,s_id from student order by class ASC"];
    
    if( sqlite3_prepare_v2(database, [Query UTF8String], -1, &statement, NULL) == SQLITE_OK )
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            studentInfo *data = [[studentInfo alloc] init];
            data.m_Name =[[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 0)];
            data.m_RollNo = [[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 1)];
            data.m_Class = [[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 2)];
            data.m_Section = [[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 3)];
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


- (void) SortByClassDESC
{
    [self.studentArray removeAllObjects];
    sqlite3_stmt *statement = nil;
    sqlite3 *database = [DBConnectionManager getDatabaseObject];
    NSString *Query = [NSString stringWithFormat: @"select s_name,roll_no,class,section,s_id from student order by class DESC"];
    
    if( sqlite3_prepare_v2(database, [Query UTF8String], -1, &statement, NULL) == SQLITE_OK )
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            studentInfo *data = [[studentInfo alloc] init];
            data.m_Name =[[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 0)];
            data.m_RollNo = [[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 1)];
            data.m_Class = [[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 2)];
            data.m_Section = [[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 3)];
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

#pragma mark
#pragma UITableView Delegates and Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if([self.tableview isEqual:tableView])
    return self.studentArray.count;
    else
        return 4;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if([self.tableview isEqual:tableView])
    {
        CustomCell *customCell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
        customCell.selectionStyle = UITableViewCellSelectionStyleNone;
        [customCell.m_btnLike setTitle:@"Like" forState:UIControlStateNormal];
        studentInfo *data = (studentInfo *) [self.studentArray objectAtIndex:indexPath.row];
        data.m_id = data.m_id+indexPath.row;
        NSLog(@"s_id is -> %ld",data.m_id);
        NSLog(@"name is -> %@",data.m_Name);
        NSLog(@"rollno is -> %@",data.m_RollNo);
        NSLog(@"class is -> %@",data.m_Class);
        NSLog(@"section is -> %@",data.m_Section);
        customCell.m_lblName.text = data.m_Name;
        customCell.m_lblClass.text = data.m_Class;
        customCell.m_btnLike.layer.cornerRadius = 40/2;
        NSLog(@"title is := %@-%ld",customCell.m_btnLike.titleLabel.text,indexPath.row);
        if([customCell.m_btnLike.titleLabel.text isEqualToString:@"Liked"]) {
            [self.studentLikedArray addObject:data];
        }
        return customCell;
    }
    else
    {
        CustomSortCell *customCell = [tableView dequeueReusableCellWithIdentifier:@"CustomSortCell"];
        customCell.selectionStyle = UITableViewCellSelectionStyleNone;
        if(indexPath.row == 0)
            customCell.m_SortBy.text = @"Name ASC";
        if(indexPath.row == 1)
            customCell.m_SortBy.text = @"Name DESC";
        if(indexPath.row == 2)
            customCell.m_SortBy.text = @"Class ASC";
        if(indexPath.row == 3)
            customCell.m_SortBy.text = @"Class DESC";
        return customCell;
    }
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if([self.tableSortBy isEqual:tableView])
    {
        if(indexPath.row == 0) {
            [self SortByNameASC];
            self.tableSortBy.hidden = YES;
        }
        if(indexPath.row == 1)
        {
            [self SortByNameDESC];
            self.tableSortBy.hidden = YES;
        }
        if(indexPath.row == 2)
        {
        [self SortByClassASC];
            self.tableSortBy.hidden = YES;
        }
        if(indexPath.row == 3) {
            [self SortByClassDESC];
            self.tableSortBy.hidden = YES;
        }
    }
    else
    {
        RegistrationViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"RegistrationViewController"];
        detailVC.myBool = YES;
        studentInfo *data = (studentInfo *) [_studentArray objectAtIndex:indexPath.row];
        detailVC.StudentEdit = data;
        [self.navigationController pushViewController:detailVC animated:YES];
    }
}

#pragma mark
#pragma UIControls Methods


-(IBAction)onRegisterButtonPressed:(id)sender
{
    NSLog(@"Register button pressed");
    RegistrationViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"RegistrationViewController"];
    [self.navigationController pushViewController:detailVC animated:YES];
    
}


-(IBAction)onSortByButtonPressed:(id)sender
{
    NSLog(@"SortBy button is pressed");
    self.tableSortBy.hidden = NO;
}


-(IBAction)FavoriteView:(id)sender
{
    NSLog(@"FavoriteView clicked");
    
    FavoriteViewController *favoriteVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FavoriteViewController"];
    favoriteVC.FavoriteArray = self.studentLikedArray;
    [self.navigationController pushViewController:favoriteVC animated:YES];
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
