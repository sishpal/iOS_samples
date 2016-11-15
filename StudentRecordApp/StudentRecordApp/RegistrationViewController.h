//
//  RegistrationViewController.h
//  StudentRecordApp
//
//  Created by Beryl Systems on 11/11/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowAllStudentViewController.h"

@interface RegistrationViewController : UIViewController <UITextFieldDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *m_scrollView;
@property (nonatomic, strong) IBOutlet UITextField *m_txtName;
@property (nonatomic, strong) IBOutlet UITextField *m_txtrollNo;
@property (nonatomic, strong) IBOutlet UITextField *m_txtClass;
@property (nonatomic, strong) IBOutlet UITextField *m_txtSection;
@property (nonatomic, strong) UITextField *m_txtActive;
@property (nonatomic, assign) BOOL *myBool;
@property (nonatomic, strong) studentInfo *StudentEdit;
@property (nonatomic, strong) IBOutlet UIButton *btnRegister;




@end
