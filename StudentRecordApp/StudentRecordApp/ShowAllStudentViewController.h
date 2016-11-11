//
//  ShowAllStudentViewController.h
//  StudentRecordApp
//
//  Created by Beryl Systems on 11/11/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"

@interface ShowAllStudentViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property(nonatomic,strong) IBOutlet UITableView *tableview;
@property (nonatomic, strong) NSMutableArray *studentArray;
@property(nonatomic,strong) studentInfo *data;


@end
