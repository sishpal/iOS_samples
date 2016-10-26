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

@interface SearchViewController : UIViewController <UITextFieldDelegate, UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong) tagInfo *objTagInfo;
@property (nonatomic, strong) NSMutableArray *arrTagInfo;
@property (nonatomic, strong) NSMutableArray *arrSelectedTagInfo;
@property (nonatomic, assign) BOOL cellSelected;
@property (nonatomic, strong) IBOutlet UIView *m_view;
@property (nonatomic, strong) IBOutlet UIView *m_searchView;
@property (nonatomic, strong) IBOutlet UIView *m_addressView;
@property (nonatomic, strong) NSArray *arrSelected;
@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (nonatomic, assign)  BOOL flag;

@end
