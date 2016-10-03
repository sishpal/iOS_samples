//
//  userInfo.h
//  KobeSample
//
//  Created by Beryl Systems on 03/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface userInfo : NSObject
@property (nonatomic, strong) NSString *m_authToken;
@property (nonatomic, strong) NSString *m_dateOfBirth;
@property (nonatomic, strong) NSString *m_emailAddress;
@property (nonatomic, strong) NSString *m_firstName;
@property (nonatomic, strong) NSString *m_lastName;
@property (nonatomic, strong) NSString *m_phoneNumber;
@property (nonatomic, strong) NSString *m_id;
@property (nonatomic, strong) NSString *m_urlLink;
@property (nonatomic, strong) NSString *m_type;
@property (nonatomic, strong) NSString *m_invitationCode;
//@property (nonatomic, strong) NSDictionary *value;




-(id)initWithData:(NSDictionary *)value;

@end
