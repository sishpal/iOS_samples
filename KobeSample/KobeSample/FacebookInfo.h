//
//  FacebookInfo.h
//  Gase
//
//  Created by Prashant Aggarwal on 4/7/16.
//  Copyright (c) 2015 Beryl Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FacebookInfo : NSObject

@property (nonatomic, strong) NSString *nId;
@property (nonatomic, strong) NSString *m_sAccessToken;
@property (nonatomic, strong) NSString *m_sFirstName;
@property (nonatomic, strong) NSString *m_sLastName;
@property (nonatomic, strong) NSString *m_sEmail;
@property (nonatomic, strong) NSString *m_sImgURL;
@property (nonatomic, strong) NSString *sBirthday;

- (id)initwithFacebookInfo : (NSMutableDictionary *)dict;

@end
