//
//  UpdateUserInfoViewController.h
//  KobeSample
//
//  Created by Beryl Systems on 14/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpdateUserInfoViewController : UIViewController <UITextFieldDelegate, UINavigationControllerDelegate,UIActionSheetDelegate>

@property (nonatomic, strong) IBOutlet UIDatePicker *m_datePicker;
@property (nonatomic, strong) userInfo *data;
@property (nonatomic, assign) IBOutlet UIToolbar *m_btnDone;
@property (nonatomic, strong) IBOutlet UITextField *m_firstName;
@property (nonatomic, strong) IBOutlet UITextField *m_lastName;
@property (nonatomic, strong) IBOutlet UITextField *m_emailAddress;
@property (nonatomic, strong) IBOutlet UIButton *m_dateOfBirth;
@property (nonatomic, strong) UITextField *m_txtActive;
@property (nonatomic, strong) IBOutlet UIScrollView *m_scrollView;
@property (nonatomic, strong) IBOutlet UIImageView *m_image;


@end
