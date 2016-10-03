//
//  userInfo.m
//  KobeSample
//
//  Created by Beryl Systems on 03/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "userInfo.h"

@implementation userInfo

- (id)init
{
    if(self == [super init])
    {
        self.m_authToken = @"";
        self.m_dateOfBirth = @"";
        self.m_emailAddress = @"";
        self.m_firstName = @"";
        self.m_lastName = @"";
        self.m_invitationCode = @"";
        self.m_phoneNumber = @"";
        self.m_id = @"";
        self.m_urlLink = @"";
        self.m_type = @"";
    }
    return self;
}


-(id)initWithData:(NSDictionary *)dicData
{
    NSLog(@"initWithData method run");
    NSDictionary *dicAttribute = [Utility getFormattedValue:[dicData objectForKey:@"attributes"]];
    self.m_id = [Utility getFormattedValue:[dicData objectForKey:@"id"]];
    self.m_urlLink = [Utility getFormattedValue:[dicData objectForKey:@"links"]];
    self.m_type = [Utility getFormattedValue:[dicData objectForKey:@"type"]];
    self.m_authToken = [Utility getFormattedValue:[dicAttribute objectForKey:@"auth_token"]];
    self.m_dateOfBirth = [Utility getFormattedValue:[dicAttribute objectForKey:@"date_of_birth"]];
    self.m_emailAddress = [Utility getFormattedValue:[dicAttribute objectForKey:@"email"]];
    self.m_firstName = [Utility getFormattedValue:[dicAttribute objectForKey:@"first_name"]];
    self.m_lastName = [Utility getFormattedValue:[dicAttribute objectForKey:@"last_name"]];
    self.m_invitationCode = [Utility getFormattedValue:[dicAttribute objectForKey:@"invitation_code"]];
    self.m_phoneNumber = [Utility getFormattedValue:[dicAttribute objectForKey:@"phone_no"]];
    NSLog(@"first name is -> %@",_m_firstName);

    return self;
}


@end
