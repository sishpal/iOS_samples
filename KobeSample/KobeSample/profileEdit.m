//
//  profileEdit.m
//  KobeSample
//
//  Created by Beryl Systems on 14/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "profileEdit.h"

@implementation profileEdit

- (id)init
{
    if(self == [super init])
    {
        self.m_type = @"";
        self.m_id = @"";
        self.m_firstName = @"";
        self.m_lastName = @"";
        self.m_emailAddress = @"";
        self.m_dateOfBirth = @"";
        self.m_authToken = @"";
        self.m_invitationCode = @"";
        self.m_subscription = @"";
        self.m_self = @"";
    }
    return self;
}


-(id)initWithData:(NSDictionary *)dicUserData
{
    NSLog(@"initWithVenueData method run");
    
    NSDictionary *dicUser = [Utility getFormattedValue:[dicUserData objectForKey:@"user"]];
    NSDictionary *dicData = [Utility getFormattedValue:[dicUser objectForKey:@"data"]];
    self.m_id = [Utility getFormattedValue:[dicData objectForKey:@"id"]];
    self.m_type = [Utility getFormattedValue:[dicData objectForKey:@"type"]];
    NSDictionary *dicAttribute = [Utility getFormattedValue:[dicData objectForKey:@"attributes"]];
    self.m_firstName = [Utility getFormattedValue:[dicAttribute objectForKey:@"first_name"]];
    self.m_lastName = [Utility getFormattedValue:[dicAttribute objectForKey:@"last_name"]];
    self.m_emailAddress = [Utility getFormattedValue:[dicAttribute objectForKey:@"email"]];
    self.m_dateOfBirth = [Utility getFormattedValue:[dicAttribute objectForKey:@"date_of_birth"]];
    self.m_authToken = [Utility getFormattedValue:[dicAttribute objectForKey:@"auth_token"]];
    self.m_invitationCode = [Utility getFormattedValue:[dicAttribute objectForKey:@"invitation_code"]];
    self.m_subscription = [Utility getFormattedValue:[dicAttribute objectForKey:@"suscription"]];
    self.m_links = [Utility getFormattedValue:[dicData objectForKey:@"links"]];
    NSLog(@"m_distance is %@",_m_firstName);
    NSLog(@"_m_latitude is => %@",_m_lastName);
    
    return self;
}



@end
