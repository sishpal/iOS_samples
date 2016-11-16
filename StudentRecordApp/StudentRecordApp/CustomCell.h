//
//  CustomCell.h
//  StudentRecordApp
//
//  Created by Beryl Systems on 11/11/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UILabel *m_lblName;
@property (nonatomic, strong) IBOutlet UILabel *m_lblClass;
@property (nonatomic, strong) IBOutlet UIButton *m_btnLike;
@property (nonatomic , strong) NSMutableArray *m_Finalarray;


@end
