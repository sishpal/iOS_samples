//
//  ViewController.h
//  employeeData
//
//  Created by Beryl Systems on 17/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "DataHolder.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *empinfoArray;
@property(nonatomic,strong) IBOutlet UITableView *tableview;
@property (nonatomic,strong) NSIndexPath *index;
@property(nonatomic,strong) DataHolder *data;



@end

