//
//  DetailViewController.h
//  employeeData
//
//  Created by Beryl Systems on 17/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataHolder.h"


@interface DetailViewController : UIViewController <UITextFieldDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) IBOutlet UITextField *m_txtfEmpName;
@property (nonatomic, strong) IBOutlet UITextField *m_txtfEmpAddr;
@property (nonatomic, strong) IBOutlet UITextField *m_txtfEmpId;
@property (nonatomic, strong) IBOutlet UIButton *m_btnsaveupdate;
@property (nonatomic, strong) DataHolder *datainfo;
@property (nonatomic, strong) IBOutlet UIImagePickerController *m_imgPicker;
@property (nonatomic, strong) IBOutlet UIImageView *m_imageView;
@property (nonatomic, assign) BOOL myBool;



@end
