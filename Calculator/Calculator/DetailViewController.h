//
//  DetailViewController.h
//  Calculator
//
//  Created by Beryl Systems on 14/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate, UIActionSheetDelegate>
@property (nonatomic, strong) IBOutlet UILabel *m_lbsliderValue;
@property (nonatomic, strong) IBOutlet UISlider *m_slider;
@property (nonatomic, strong) IBOutlet UITextField *m_tfslidervalue;
@property (nonatomic, strong) IBOutlet UIButton *m_btnSubmit;
@property (nonatomic, strong) IBOutlet UIButton *m_btnactionsheet;

@end
