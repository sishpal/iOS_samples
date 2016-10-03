//
//  DetailViewController.h
//  KobeSample
//
//  Created by Beryl Systems on 01/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "ViewController.h"
#import "DetailsViewController.h"

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

@end
