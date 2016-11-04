//
//  VenuesName.m
//  KobeSample
//
//  Created by Beryl Systems on 04/11/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "VenuesName.h"

@implementation VenuesName

- (id)init
{
    if(self == [super init])
    {
        self.m_Name = @"";
        self.m_Id = @"";
    }
    return self;
}


-(id)initWithData:(NSDictionary *)dicData
{
    NSLog(@"method run");
    self.m_Name = [Utility getFormattedValue:[dicData objectForKey:@"name"]];
    self.m_Id = [Utility getFormattedValue:[dicData objectForKey:@"id"]];
    NSLog(@"m_name is =>> %@",_m_Name);
    NSLog(@"m_id is =>> %@",_m_Id);
    return self;
}


@end
