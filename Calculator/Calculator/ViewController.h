//
//  ViewController.h
//  Calculator
//
//  Created by Beryl Systems on 14/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate, UIActionSheetDelegate>

@property (nonatomic, strong) IBOutlet UILabel *m_lbnumber1;
@property (nonatomic, strong) IBOutlet UILabel *m_lbnumber2;
@property (nonatomic, strong) IBOutlet UITextField *m_number1;
@property (nonatomic, strong) IBOutlet UITextField *m_number2;
@property (nonatomic, strong) IBOutlet UILabel *m_lbSum;


@end

