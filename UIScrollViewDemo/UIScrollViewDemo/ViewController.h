//
//  ViewController.h
//  UIScrollViewDemo
//
//  Created by Beryl Systems on 22/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *m_scrollView;
@property (nonatomic, strong) IBOutlet UIImageView *m_imageView;
@property (nonatomic, strong) IBOutlet UIView *m_view;
@property (nonatomic, strong) IBOutlet UITextField *m_firstName;
@property (nonatomic, strong) IBOutlet UITextField *m_lastName;
@property (nonatomic, strong) IBOutlet UITextField *m_dob;
@property (nonatomic, strong) IBOutlet UITextField *m_contactNumber;
@property (nonatomic, strong) IBOutlet UITextField *m_emailAddress;
@property (nonatomic, strong) IBOutlet UITextField *m_password;
@property (nonatomic, strong) IBOutlet UITextField *m_rePassword;
@property (nonatomic, strong) UITextField *m_txtActive;
@property (nonatomic, assign) BOOL myBool;




@end

