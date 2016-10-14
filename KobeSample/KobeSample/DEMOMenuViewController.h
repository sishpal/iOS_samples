//
//  DEMOMenuViewController.h
//  REFrostedViewControllerStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"
#import <MessageUI/MessageUI.h>
#import "UpdateUserInfoViewController.h"
#import "AfterMenuViewController.h"

@interface DEMOMenuViewController : UITableViewController <MFMailComposeViewControllerDelegate>
@property (nonatomic, strong) NSMutableArray *arrMenuTitle;
@property (nonatomic, strong) IBOutlet UIView *vwBottomView;
@property (nonatomic, strong) NSMutableArray *arrData;

- (void)ReloadData;

@end
