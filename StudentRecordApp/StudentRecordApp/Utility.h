//
//  Utility.h
//  StudentRecordApp
//
//  Created by Beryl Systems on 11/11/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Utility : NSObject
@property (nonatomic, assign) NSInteger result;
@property (nonatomic, strong) NSString *value;

+ (NSString *)iPhoneModel;
+ (id)getFormattedValue:(id)value;
+ (NSString *) base64StringFromData: (NSData *)data length: (int)length;
+ (void)showAlertWithTitle:(NSString *)title withMessage:(NSString *)message;

@end
