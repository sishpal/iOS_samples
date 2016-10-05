//
//  ShowAllVenue.h
//  KobeSample
//
//  Created by Beryl Systems on 03/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "CustomViewCell.h"
#import "DetailsViewController.h"
#import "SearchViewController.h"

@interface ShowAllVenue : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *m_arrInfo;
@property (nonatomic, strong) IBOutlet UITableView *tableview;



@end
