//
//  NotificationViewController.h
//  KobeSample
//
//  Created by Beryl Systems on 22/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NotificationViewCell.h"
#import "DetailsViewController.h"

@interface NotificationViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *m_tblView;
@property (nonatomic, strong) NSMutableArray *m_arrInfo;


@end
