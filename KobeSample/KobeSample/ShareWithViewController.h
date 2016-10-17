//
//  ShareWithViewController.h
//  KobeSample
//
//  Created by Beryl Systems on 17/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ShareWithViewController : UIViewController <UIAlertViewDelegate>


@property(nonatomic, strong) IBOutlet UIButton *btnFacebook;
@property(nonatomic, strong) IBOutlet UIButton *btnTwitter;
@property(nonatomic, strong) IBOutlet UIButton *btnWhatsApp;

@end
