//
//  ViewController.h
//  AccordianSample
//
//  Created by Beryl Systems on 07/11/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"
#import "FZAccordionTableView/FZAccordionTableView.h"
@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource,UIGestureRecognizerDelegate>


@property(nonatomic, strong)IBOutlet UITableView *m_tableView;
@property (nonatomic, strong) NSString *name;

@end

