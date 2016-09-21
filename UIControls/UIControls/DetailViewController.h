//
//  DetailViewController.h
//  UIControls
//
//  Created by Beryl Systems on 14/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UILabel *m_lblName;
@property (nonatomic, strong) IBOutlet UIButton *my_btnPop;
@property (nonatomic, strong) IBOutlet UILabel *name_lblName;
@property (nonatomic, strong) IBOutlet UITextField * name_tfName;

@end
