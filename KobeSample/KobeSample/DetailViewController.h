//
//  DetailViewController.h
//  KobeSample
//
//  Created by Beryl Systems on 01/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "ViewController.h"
#import "AfterSignUpViewController.h"
#import "EmailViewController.h"

@interface DetailViewController : UIViewController <UITextFieldDelegate, UINavigationControllerDelegate,UIActionSheetDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *m_scrollView;
@property (nonatomic, strong) IBOutlet UIView *m_view;
@property (nonatomic, strong) IBOutlet UITextField *m_txtFirstName;
@property (nonatomic, strong) IBOutlet UITextField *m_txtlastName;
@property (nonatomic, strong) IBOutlet UITextField *m_txtEmailAddress;
@property (nonatomic, strong) IBOutlet UITextField *m_txtPassword;
@property (nonatomic, strong) UITextField *m_txtActive;
@property (nonatomic, strong) IBOutlet UIDatePicker *m_datePicker;
@property (nonatomic, strong) IBOutlet UIButton *m_btnDateOfBirth;
@property (nonnull, assign) IBOutlet UIToolbar *m_btnDone;
@property (nonatomic, strong) FacebookInfo *faceBookInfo;
@property (nonatomic, strong) NSString *sIsProvider;
@property (nonatomic, strong) NSMutableDictionary *dicFacebookInfo;
@property (nonatomic, strong) NSString *m_fbId;
@property (nonatomic, strong) NSString *m_access_token;


@end
