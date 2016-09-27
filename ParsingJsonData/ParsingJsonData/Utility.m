//
//  Utility.m
//  ParsingJsonData
//
//  Created by Beryl Systems on 27/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "Utility.h"

@implementation Utility
+ (id)getFormattedValue:(id)value
{
    if(value)
    {
        if([value isKindOfClass:[NSNull class]])
        {
            return [NSString string];
        }
        else if([value isKindOfClass:[NSNumber class]])
        {
            return [(NSNumber *)value stringValue];
        }
        else if([value isKindOfClass:[NSString class]])
        {
            if(([value caseInsensitiveCompare:@"null"] == NSOrderedSame) || ([value caseInsensitiveCompare:@"(null)"] == NSOrderedSame))
            {
                return [NSString string];
            }
            else
            {
                return value;
            }
        }
        else
        {
            return value;
        }
    }
    return [NSString string];
}

+ (NSString *)iPhoneModel
{
    NSString *iPhoneModel = @"";
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 568)
        {
            // iPhone Classic
            iPhoneModel = @"iphone5s";
        }
        else if(result.height == 667)
        {
            // iPhone 5
            iPhoneModel = @"iphone6";
        }
        else if (result.height == 480)
        {
            iPhoneModel = @"iphone4s";
        }
        else
        {
            iPhoneModel = @"iphone6+";
        }
    }
    return iPhoneModel;
}

@end
