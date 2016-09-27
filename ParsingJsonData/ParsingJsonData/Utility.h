//
//  Utility.h
//  ParsingJsonData
//
//  Created by Beryl Systems on 27/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject
@property (nonatomic, assign) NSInteger result;
@property (nonatomic, strong) NSString *value;

+ (NSString *)iPhoneModel;
+ (id)getFormattedValue:(id)value;

@end
