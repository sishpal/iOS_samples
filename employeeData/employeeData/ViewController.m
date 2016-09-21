//
//  ViewController.m
//  employeeData
//
//  Created by Beryl Systems on 17/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "customViewCell.h"
#import "DBConnectionManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _empinfoArray = [[NSMutableArray alloc] init];
    self.automaticallyAdjustsScrollViewInsets = NO;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self showData];
    
}





# pragma mark
# pragma Class method

- (void) showData
{
    [_empinfoArray removeAllObjects];
    
    sqlite3_stmt *statement = nil;
    sqlite3 *database = [DBConnectionManager getDatabaseObject];
    NSString *Query = [NSString stringWithFormat: @"select pid,name,address,id from emp"];
    
    if( sqlite3_prepare_v2(database, [Query UTF8String], -1, &statement, NULL) == SQLITE_OK )
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            DataHolder *data = [[DataHolder alloc] init];
            data.pId =[[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 0)];
            //NSLog(@"value of pid is =: %@",data.pId);
            data.empName = [[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 1)];
            data.empAddress = [[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 2)];
            data.empId = [[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 3)];

            [_empinfoArray addObject:data];
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
#pragma mark - UITableView DataSource and Delegates Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _empinfoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    customViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:@"customViewCell"];
    
     DataHolder *data = (DataHolder *) [_empinfoArray objectAtIndex:indexPath.row];
    
    customCell.m_lblEmpName.text = data.empName;
    customCell.m_lblEmpAddr.text = data.empAddress;
    customCell.m_lblEmpId.text = data.empId;
    
    //customCell.m_lblEmpId.text = [self.empinfoArray objectAtIndex:indexPath.row];
    return customCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    DataHolder *data = (DataHolder *) [_empinfoArray objectAtIndex:indexPath.row];
    detailVC.datainfo = data;
    detailVC.myBool = NO;
    [self.navigationController pushViewController:detailVC animated:YES];
    


    
}





-(void)deleteData : (NSString *)pId
{
    sqlite3_stmt *statement = nil;
    sqlite3 *database = [DBConnectionManager getDatabaseObject];
    NSLog(@"emp pid = %@",pId);
    
    NSString *query = [NSString stringWithFormat:@"delete from emp where pid = '%@'",pId];
    
    if( sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, NULL) == SQLITE_OK )
    {
        if( sqlite3_step(statement) == SQLITE_DONE )
        {
            NSLog(@"Sucessfully deleted");
            NSLog(@"employee pid = %@",pId);
            [self.empinfoArray removeObjectAtIndex:_index.row];
            [_tableview reloadData];
        }
    }
    
    else
    {
        NSLog( @"Failed from sqlite3_prepare_v2. Error is:  %s", sqlite3_errmsg(database) );
    }
    // Finalize statement.
    sqlite3_finalize(statement);
    statement = nil;
}





#pragma mark
#pragma  method for delete the row.

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    DataHolder *data = (DataHolder *) [_empinfoArray objectAtIndex:indexPath.row];
    self.index = indexPath;
    NSLog(@"PID = %@",data.pId);
    [self deleteData: data.pId];
}




- (IBAction)onAddButtonPressed:(id)sender
{
    NSLog(@"Next (+) button pressed");
    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    detailVC.myBool = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
}


@end
