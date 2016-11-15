//
//  FavoriteViewController.h
//  StudentRecordApp
//
//  Created by Beryl Systems on 15/11/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavoriteCell.h"
@interface FavoriteViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UITableView *m_tableView;
@property (nonatomic, strong) NSMutableArray *FavoriteArray;

@end
