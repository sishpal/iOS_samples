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
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
//    [self.m_btnLike setTitle:@"Like" forState:UIControlStateNormal];


    // Configure the view for the selected state
}
-(IBAction)onLikeButtonPressed:(id)sender
{
    [self isLike];
}


-(void)isLike
{
    if([self.m_btnLike.titleLabel.text isEqualToString:@"Like"])
    {
        [self.m_btnLike setTitle:@"Liked" forState:UIControlStateNormal];
    }
    else if([self.m_btnLike.titleLabel.text isEqualToString:@"Liked"])
        [self.m_btnLike setTitle:@"Like" forState:UIControlStateNormal];
}


@end
