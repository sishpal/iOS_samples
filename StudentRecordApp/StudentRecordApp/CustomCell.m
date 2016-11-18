//
//  CustomCell.m
//  StudentRecordApp
//
//  Created by Beryl Systems on 11/11/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (void)awakeFromNib {
    [super awakeFromNib];

    // Initialization code
    self.m_filteredArray = [[NSMutableArray alloc] init];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
//    [self.m_btnLike setTitle:@"Like" forState:UIControlStateNormal];

    // Configure the view for the selected state
}

#pragma mark
#pragma UIControl Method

-(IBAction)onLikeButtonPressed:(id)sender
{
    [self isLike];
}

#pragma mark
#pragma UIClass Methods

-(void)isLike
{
    
    NSLog(@"student id is: %ld",_studentData.m_id);
    if([self.parentVC isKindOfClass:[ShowAllStudentViewController class]])
    {
        ShowAllStudentViewController *showAllStudentVC = (ShowAllStudentViewController *)self.parentVC;
        if([self.m_btnLike.titleLabel.text isEqualToString:@"Like"])
        {
            [self.m_btnLike setTitle:@"Liked" forState:UIControlStateNormal];
            //add values in array
//            [showAllStudentVC.SelectedLikeArray addObject:_studentData];
            [self UpdateFavorite_1];
        }
        else if([self.m_btnLike.titleLabel.text isEqualToString:@"Liked"])
        {
            [self.m_btnLike setTitle:@"Like" forState:UIControlStateNormal];
//            [showAllStudentVC.SelectedLikeArray removeObject:_studentData];
            [self UpdateFavorite_0];
        }
        else
            [self UpdateFavorite_0];
        
        NSLog(@"Count of selectedlike array %ld",showAllStudentVC.SelectedLikeArray.count);
    }
    
}

- (void)UpdateFavorite_1
{
    sqlite3_stmt *statement = nil;
    sqlite3 *database = [DBConnectionManager getDatabaseObject];
    NSString *query = [NSString stringWithFormat:@"update student set favorites = 1 where s_id='%ld'",(long)_studentData.m_id];
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
- (void)UpdateFavorite_0
{
    sqlite3_stmt *statement = nil;
    sqlite3 *database = [DBConnectionManager getDatabaseObject];
    NSString *query = [NSString stringWithFormat:@"update student set favorites = 0 where s_id='%ld'",(long)_studentData.m_id];
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



@end
