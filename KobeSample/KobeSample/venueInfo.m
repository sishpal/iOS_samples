//
//  venueInfo.m
//  KobeSample
//
//  Created by Beryl Systems on 03/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "venueInfo.h"

@implementation venueInfo


- (id)init
{
    if(self == [super init])
    {
        self.m_type = @"";
        self.m_id = @"";
        self.m_name = @"";
        self.m_address = @"";
//        self.m_image = @"";
        self.m_latitude = @"";
        self.m_longitude = @"";
        self.m_description = @"";
        self.m_contactNumber = @"";
        self.m_distance = @"";
        self.m_isOpen = @"";
        self.m_workingHours = @"";

    }
    return self;
}


-(id)initWithVenueData:(NSDictionary *)dicVenueData
{
    NSLog(@"initWithVenueData method run");
    self.m_id = [Utility getFormattedValue:[dicVenueData objectForKey:@"id"]];
    self.m_name = [Utility getFormattedValue:[dicVenueData objectForKey:@"name"]];
    self.m_address = [Utility getFormattedValue:[dicVenueData objectForKey:@"address"]];
//    self.m_image = [Utility getFormattedValue:[dicVenueData objectForKey:@"images"]];
    self.m_longitude = [Utility getFormattedValue:[dicVenueData objectForKey:@"longitude"]];
    self.m_latitude = [Utility getFormattedValue:[dicVenueData objectForKey:@"latitude"]];
    self.m_description = [Utility getFormattedValue:[dicVenueData objectForKey:@"description"]];
    self.m_contactNumber = [Utility getFormattedValue:[dicVenueData objectForKey:@"contact_no"]];
    self.m_distance = [Utility getFormattedValue:[dicVenueData objectForKey:@"distance"]];
    self.m_isOpen = [Utility getFormattedValue:[dicVenueData objectForKey:@"is_open"]];
    self.m_workingHours = [Utility getFormattedValue:[dicVenueData objectForKey:@"working_hour"]];

    return self;
}


@end
