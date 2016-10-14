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
    
    NSDictionary *dicAttribute = [Utility getFormattedValue:[dicVenueData objectForKey:@"attributes"]];
    self.m_id = [Utility getFormattedValue:[dicVenueData objectForKey:@"id"]];
    self.m_type = [Utility getFormattedValue:[dicVenueData objectForKey:@"type"]];
    self.m_name = [Utility getFormattedValue:[dicAttribute objectForKey:@"name"]];
    self.m_address = [Utility getFormattedValue:[dicAttribute objectForKey:@"address"]];
    self.m_imageURL = [Utility getFormattedValue:[dicAttribute objectForKey:@"images"]];
    self.m_longitude = [Utility getFormattedValue:[dicAttribute objectForKey:@"longitude"]];
    self.m_latitude = [Utility getFormattedValue:[dicAttribute objectForKey:@"latitude"]];
    self.m_description = [Utility getFormattedValue:[dicAttribute objectForKey:@"description"]];
    self.m_contactNumber = [Utility getFormattedValue:[dicAttribute objectForKey:@"contact_no"]];
    self.m_distance = [Utility getFormattedValue:[dicAttribute objectForKey:@"distance"]];
    self.m_isOpen = [Utility getFormattedValue:[dicAttribute objectForKey:@"is_open"]];
    self.m_workingHours = [Utility getFormattedValue:[dicAttribute objectForKey:@"working_hour"]];
   // NSLog(@"m_id is %@",_m_id);
    NSLog(@"m_distance is %@",_m_distance);
    NSLog(@"_m_latitude is => %@",_m_latitude);

    return self;
}


@end
