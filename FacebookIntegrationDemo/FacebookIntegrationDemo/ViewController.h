//
//  ViewController.h
//  FacebookIntegrationDemo
//
//  Created by Beryl Systems on 18/10/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
#import "EmailViewController.h"

@interface ViewController : UIViewController <UIAlertViewDelegate>
@property (nonatomic, strong) FacebookInfo *faceBookInfo;
@property (nonatomic, strong) NSString *sIsProvider;
@property (nonatomic, strong) NSMutableDictionary *dicFacebookInfo;
@property (nonatomic, strong) NSString *m_fbId;
@property (nonatomic, strong) NSString *m_access_token;


@end

