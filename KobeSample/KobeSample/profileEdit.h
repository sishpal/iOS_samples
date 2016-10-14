//
//  profileEdit.h
//  KobeSample
//
//  Created by Beryl Systems on 14/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface profileEdit : NSObject

@property (nonatomic, strong) NSString *m_id;
@property (nonatomic, strong) NSString *m_type;
@property (nonatomic, strong) NSString *m_emailAddress;
@property (nonatomic, strong) NSString *m_firstName;
@property (nonatomic, strong) NSString *m_lastName;
@property (nonatomic, strong) NSString *m_dateOfBirth;
@property (nonatomic, strong) NSString *m_authToken;
@property (nonatomic, strong) NSString *m_invitationCode;
@property (nonatomic, strong) NSString *m_subscription;
@property (nonatomic, strong) NSString *m_self;
@property (nonatomic, strong) NSMutableDictionary *m_links;

-(id)initWithData:(NSDictionary *)value;

@end
