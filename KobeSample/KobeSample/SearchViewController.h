//
//  SearchViewController.h
//  KobeSample
//
//  Created by Beryl Systems on 05/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"
#import "tagInfo.h"
#import "ShowAllVenue.h"
#import "TableViewCell.h"

@interface SearchViewController : UIViewController <UITextFieldDelegate, UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDataSource, UITableViewDelegate>




@property(nonatomic,strong) tagInfo *objTagInfo;
@property (nonatomic, strong) NSMutableArray *arrTagInfo;
@property (nonatomic, strong) NSMutableArray *arrSelectedTagInfo;
@property (nonatomic, assign) BOOL cellSelected;
@property (nonatomic, strong) IBOutlet UIView *m_view;
@property (nonatomic, strong) IBOutlet UITextField *m_txtSearchViaResturent;
@property (nonatomic, strong) IBOutlet UITextField *m_txtSearchViaAddress;
@property (nonatomic, strong) NSMutableArray *arrSelected;
@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (nonatomic, assign)  BOOL flag;
@property (nonatomic, strong) NSMutableArray *arrVenuesName;
@property (nonatomic, strong) IBOutlet UITableView *tableview;
@property (nonatomic, strong) NSString *myString;
@property (nonatomic, strong) NSMutableArray *arrFinal;



@end
