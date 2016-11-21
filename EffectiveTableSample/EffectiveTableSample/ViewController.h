//
//  ViewController.h
//  EffectiveTableSample
//
//  Created by Beryl Systems on 18/11/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerCell.h"
#import "ScrollViewController.h"
#import "FXBlurView.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UITableView *m_tableView;
@property (nonatomic, strong) IBOutlet UIImageView *m_imageView;
@property (nonatomic, weak) IBOutlet  FXBlurView *blurView;





@end

