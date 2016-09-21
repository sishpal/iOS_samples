//
//  ViewController.h
//  imageView
//
//  Created by Beryl Systems on 15/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate>
@property (nonatomic, strong) IBOutlet UILabel *m_lbColor;
@property (nonatomic, strong) IBOutlet UITextField *m_txtfColor;
@property (nonatomic, strong) IBOutlet UIImageView *m_imageView;




@end

