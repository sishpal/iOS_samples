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
            [showAllStudentVC.SelectedLikeArray addObject:_studentData];
        }
        else if([self.m_btnLike.titleLabel.text isEqualToString:@"Liked"])
        {
            [self.m_btnLike setTitle:@"Like" forState:UIControlStateNormal];
            [showAllStudentVC.SelectedLikeArray removeObject:_studentData];
//            [showAllStudentVC.SelectedLikeArray addObject:@""];
        }
        NSLog(@"Count of selectedlike array %ld",showAllStudentVC.SelectedLikeArray.count);
    }
    
}


@end
