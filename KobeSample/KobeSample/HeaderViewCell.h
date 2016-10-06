//
//  HeaderViewCell.h
//  Gase
//
//  Created by Prashant Aggarwal on 4/14/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UIImageView *m_profileImage;
@property (nonatomic, strong) IBOutlet UILabel *m_lblName;
@property (nonatomic, strong) IBOutlet UILabel *m_lblEmail;

@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activityIndicator;

- (void)setCellData : (userInfo *)userInfo;

@end
