//
//  ViewController.h
//  SearchBarSample
//
//  Created by Beryl Systems on 09/11/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate>

@property (nonatomic, strong) IBOutlet UISearchBar *m_searchBar;
@property (nonatomic, strong) NSArray *m_arrName;
@property (nonatomic, strong) NSMutableArray *m_arrFinal;
@property (nonatomic, strong) IBOutlet UITableView *m_tableView;
@property (nonatomic, strong) IBOutlet UISearchDisplayController *searchBarController;
@property (nonatomic, assign) BOOL m_isSearch;


@end

