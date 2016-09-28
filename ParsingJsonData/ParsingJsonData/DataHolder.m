//
//  DataHolder.m
//  ParsingJsonData
//
//  Created by Beryl Systems on 27/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "DataHolder.h"

@implementation DataHolder

- (id)init
{
    if(self == [super init])
    {
        self.m_Name = @"";
        self.m_Address= @"";
        self.m_Distance = @"";
        self.m_Description = @"";
    }
    return self;
}

-(id)initWithData:(NSDictionary *)dicData
{
    NSLog(@"method run");
    NSDictionary *dicAttribute = [Utility getFormattedValue:[dicData objectForKey:@"attributes"]];
    self.m_Address = [Utility getFormattedValue:[dicAttribute objectForKey:@"address"]];
    self.m_Distance = [Utility getFormattedValue:[dicAttribute objectForKey:@"distance"]];
    self.m_Name = [Utility getFormattedValue:[dicAttribute objectForKey:@"name"]];
    self.m_Description = [Utility getFormattedValue:[dicAttribute objectForKey:@"description"]];
    self.m_Hours = [Utility getFormattedValue:[dicAttribute objectForKey:@"working_hour"]];
    NSLog(@"description is => %@",self.m_Description);
    NSLog(@"hours is => %@",_m_Hours);

    return self;
}
@end
