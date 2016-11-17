//
//  ShowAllStudentViewController.h
//  StudentRecordApp
//
//  Created by Beryl Systems on 11/11/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"
#import "RegistrationViewController.h"
#import "CustomSortCell.h"
#import "FavoriteViewController.h"

@interface ShowAllStudentViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic,strong) IBOutlet UITableView *tableview;
@property(nonatomic,strong) IBOutlet UITableView *tableSortBy;
@property (nonatomic, strong) NSMutableArray *studentArray;
@property (nonatomic,strong) studentInfo *data;
@property (nonatomic, assign) NSMutableArray *SelectedLikeArray;
@property (nonatomic, strong) IBOutlet UIButton *m_btnLike;
@property (nonatomic, strong) NSMutableArray *FinalArray;


@end
