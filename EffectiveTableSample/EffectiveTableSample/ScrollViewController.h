//
//  ScrollViewController.h
//  EffectiveTableSample
//
//  Created by Beryl Systems on 18/11/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomScrollViewControlllerCell.h"
#import "ViewControllerCell.h"

@interface ScrollViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UICollectionView *m_collectionView;
@property (nonatomic, strong) IBOutlet UITableView *m_tableView;


@end
