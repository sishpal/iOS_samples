//
//  NotificationViewCell.h
//  KobeSample
//
//  Created by Beryl Systems on 22/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationViewCell : UITableViewCell <UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, strong) IBOutlet UILabel *m_lblDescritpion;
@property (nonatomic, strong) IBOutlet UILabel *m_lblTime;
@property (nonatomic, strong) IBOutlet UIImageView *m_imgView;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activityIndicator;


@end
