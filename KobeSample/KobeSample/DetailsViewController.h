//
//  DetailsViewController.h
//  KobeSample
//
//  Created by Beryl Systems on 04/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomDetailsViewCell.h"
#import "MapViewController.h"

@interface DetailsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) venueInfo *data;
@property (nonatomic, strong) IBOutlet UIButton *m_btnRedeem;
@property (nonatomic, strong) IBOutlet UITableView *m_tableView;
@property (nonatomic, strong) NSString *isOpen;


@end
