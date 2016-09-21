//
//  customViewCell.h
//  employeeData
//
//  Created by Beryl Systems on 17/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *m_lblEmpName;
@property (nonatomic, strong) IBOutlet UILabel *m_lblEmpId;
@property (nonatomic, strong) IBOutlet UILabel *m_lblEmpAddr;

@end

