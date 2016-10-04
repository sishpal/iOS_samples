//
//  CustomDetailsViewCell.h
//  KobeSample
//
//  Created by Beryl Systems on 04/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomDetailsViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UILabel *m_lblName;
@property (nonatomic, strong) IBOutlet UILabel *m_lblAddress;
@property (nonatomic, strong) IBOutlet UILabel *m_lblDescription;
@property (nonatomic, strong) IBOutlet UILabel *m_lblHours;
@property (nonatomic, strong) IBOutlet UIImageView *m_imgview;
@property (nonatomic, strong) IBOutlet UILabel *m_lblDistance;
@property (nonatomic, strong) IBOutlet UILabel *m_lblIsOpen;

@end
