//
//  Utility.m
//  UIScrollViewDemo
//
//  Created by Beryl Systems on 22/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "Utility.h"

@implementation Utility



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
