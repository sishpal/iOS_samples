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
    NSLog(@"name is %@",self.m_Name);
    return self;
}
@end
