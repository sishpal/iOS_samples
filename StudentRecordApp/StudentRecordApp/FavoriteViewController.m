//
//  FavoriteViewController.m
//  StudentRecordApp
//
//  Created by Beryl Systems on 15/11/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "FavoriteViewController.h"

@interface FavoriteViewController ()

@end

@implementation FavoriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.FavoriteArray = [[NSMutableArray alloc] init];
    [self showData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma UIClass Methods


- (void) showData
{
    [self.FavoriteArray removeAllObjects];
    sqlite3_stmt *statement = nil;
    sqlite3 *database = [DBConnectionManager getDatabaseObject];
    NSString *Query = [NSString stringWithFormat: @"select s_name,roll_no,class,section,s_id,favorites from student where favorites = 1"];
    
    if( sqlite3_prepare_v2(database, [Query UTF8String], -1, &statement, NULL) == SQLITE_OK )
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            studentInfo *data = [[studentInfo alloc] init];
            data.m_Name =[[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 0)];
            data.m_RollNo = [[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 1)];
            data.m_Class = [[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 2)];
            data.m_Section = [[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 3)];
            data.m_id =  sqlite3_column_int(statement, 4);
            data.m_favorites = sqlite3_column_int(statement, 5);
            [self.FavoriteArray addObject:data];
        }
    }
    else
    {
        
        NSLog( @"Failed from sqlite3_prepare_v2. Error is:  %s", sqlite3_errmsg(database) );
    }
    // Finalize statement.
    
    sqlite3_finalize(statement);
    
    statement = nil;
    [self.m_tableView reloadData];
}


#pragma mark
#pragma UITableView Delegates and Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.FavoriteArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FavoriteCell *customCell = [tableView dequeueReusableCellWithIdentifier:@"FavoriteCell"];
    customCell.selectionStyle = UITableViewCellSelectionStyleNone;
    studentInfo *data = (studentInfo *) [_FavoriteArray objectAtIndex:indexPath.row];
    customCell.m_name.text = data.m_Name;
    customCell.m_name.backgroundColor = [UIColor blueColor];
    
    return customCell;

}

-(IBAction)onBackButtonPressed:(id)sender
{
    NSLog(@"Back Button Pressed");
    [self.FavoriteArray removeAllObjects];
    [self.navigationController popViewControllerAnimated:YES];
    
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
