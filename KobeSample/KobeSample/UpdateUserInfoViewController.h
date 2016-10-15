//
//  UpdateUserInfoViewController.h
//  KobeSample
//
//  Created by Beryl Systems on 14/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "userInfo.h"

@interface UpdateUserInfoViewController : UIViewController <UITextFieldDelegate, UINavigationControllerDelegate,UIActionSheetDelegate, UIImagePickerControllerDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, strong) IBOutlet UIDatePicker *m_datePicker;
@property (nonatomic, strong) IBOutlet UIImageView *m_imageView;
@property (nonatomic, assign) IBOutlet UIToolbar *m_btnDone;
@property (nonatomic, strong) IBOutlet UITextField *m_firstName;
@property (nonatomic, strong) IBOutlet UITextField *m_lastName;
@property (nonatomic, strong) IBOutlet UITextField *m_emailAddress;
@property (nonatomic, strong) IBOutlet UIButton *m_dateOfBirth;
@property (nonatomic, strong) UITextField *m_txtActive;
@property (nonatomic, strong) NSData *m_sImgData;
@property (nonatomic, strong) IBOutlet UIScrollView *m_scrollView;


@end
