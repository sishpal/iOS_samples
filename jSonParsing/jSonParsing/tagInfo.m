//
//  tagInfo.m
//  jSonParsing
//
//  Created by Beryl Systems on 26/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "tagInfo.h"

@implementation tagInfo

- (id)init
{
    if(self == [super init])
    {
        self.m_Name = @"";
        self.m_Id = @"";
        self.m_Type = @"";
    }
    return self;
}


-(id)initWithData:(NSDictionary *)dicData
{
    NSLog(@"method run");
    NSDictionary *dicAttribute = [Utility getFormattedValue:[dicData objectForKey:@"attributes"]];
    self.m_Name = [Utility getFormattedValue:[dicAttribute objectForKey:@"name"]];
    self.m_Id = [Utility getFormattedValue:[dicData objectForKey:@"id"]];
    self.m_Type = [Utility getFormattedValue:[dicData objectForKey:@"type"]];
    return self;
}

@end
