//
//  ViewController.h
//  TableView
//
//  Created by Beryl Systems on 16/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UIAlertViewDelegate, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITextField *m_txtfName;
@property (nonatomic, strong) NSMutableArray *userinfoArray;
@property (nonatomic, strong) IBOutlet UITableView *m_tblView;




@end

