//
//  EmailViewController.h
//  KobeSample
//
//  Created by Beryl Systems on 20/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface EmailViewController : UIViewController <UIAlertViewDelegate>
@property (nonatomic, strong) IBOutlet UIButton *m_btnSubmit;
@property (nonatomic, strong) IBOutlet UITextField *m_txtfEmail;
@property (nonatomic, strong) NSMutableDictionary *m_dicFacebookInfo;
@property (nonatomic, strong) NSString *m_fbId;
@property (nonatomic, strong) IBOutlet UIDatePicker *m_datePicker;
@property (nonatomic, strong) IBOutlet UIButton *m_btnDateOfBirth;
@property (nonnull, assign) IBOutlet UIButton *m_btnDone;
@end
