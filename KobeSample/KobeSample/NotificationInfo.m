//
//  NotificationInfo.m
//  KobeSample
//
//  Created by Beryl Systems on 22/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "NotificationInfo.h"

@implementation NotificationInfo

- (id)init
{
    if(self == [super init])
    {
        self.m_Description  = @"";
        self.m_Time = @"";
        self.m_VenueId = @"";
    }
    return self;
}


-(id)initWithNotificationData:(NSDictionary *)dicData
{
    NSLog(@"initWithVenueData method run");
    
    NSDictionary *dicAttribute = [Utility getFormattedValue:[dicData objectForKey:@"attributes"]];
    self.m_Description = [Utility getFormattedValue:[dicAttribute objectForKey:@"description"]];
    self.m_Time = [Utility getFormattedValue:[dicAttribute objectForKey:@"time"]];
    self.m_VenueId = [Utility getFormattedValue:[dicAttribute objectForKey:@"venue_id"]];
    
     NSLog(@"Venue id is %@",_m_VenueId);
    NSLog(@"Description is %@",self.m_Description);
    NSLog(@"Time is => %@",_m_Time);
    
    return self;
}

@end
