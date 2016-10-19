//
//  FacebookInfo.m
//  Gase
//
//  Created by Prashant Aggarwal on 4/7/16.
//  Copyright (c) 2015 Beryl Systems. All rights reserved.
//

#import "FacebookInfo.h"

@implementation FacebookInfo

- (id)init
{
    if(self == [super init])
    {
        self.nId = @"";
        self.m_sAccessToken = @"";
        self.m_sFirstName = @"";
        self.m_sLastName = @"";
        self.m_sEmail = @"";
        self.m_sImgURL = @"";
        self.sBirthday = @"";
    }
    return self;
}


- (id)initwithFacebookInfo : (NSMutableDictionary *)dict
{
    if(self == [super init])
        
    {
        self.nId = [Utility getFormattedValue:[dict valueForKey:@"id"]];
        self.m_sFirstName = [Utility getFormattedValue:[dict valueForKey:@"first_name"]];
        self.m_sLastName = [Utility getFormattedValue:[dict valueForKey:@"last_name"]];
        self.m_sEmail = [Utility getFormattedValue:[dict valueForKey:@"email"]];
        self.m_sImgURL = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?width=200&height=200",self.nId];
        self.sBirthday = [Utility getFormattedValue:[dict valueForKey:@"birthday"]];
        
        //NSLog(@"%ld",(long)[self getAge]);
    }
    return self;
    
}

- (NSInteger )getAge
{
    NSString *newStr = [self.sBirthday substringFromIndex:6];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy"];
    NSDate *dateFromString = [[NSDate alloc] init];
    dateFromString = [dateFormatter dateFromString:newStr];
    
    
    NSDate* now = [NSDate date];
    NSDateComponents* ageComponents = [[NSCalendar currentCalendar]
                                       components:NSCalendarUnitYear
                                       fromDate:dateFromString
                                       toDate:now
                                       options:0];
    NSInteger age = [ageComponents year];
    return age;
}


@end
