//
//  ViewController.h
//  jSonParsing
//
//  Created by Beryl Systems on 23/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate>
@property (nonatomic, strong) NSMutableArray *infoArray;
@property(nonatomic,strong) tagInfo *objTagInfo;
@property (nonatomic, strong) NSMutableArray *arrTagInfo;

@end

