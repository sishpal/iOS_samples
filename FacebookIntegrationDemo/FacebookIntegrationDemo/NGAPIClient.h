//
//  NGAPIClient.h
//  EventFinder
//
//  Created by Prashant Aggarwal on 11/7/15.
//  Copyright © 2015 Prashant Aggarwal. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface NGAPIClient : AFHTTPSessionManager


+ (NGAPIClient *)sharedHTTPClient;
- (instancetype)initWithBaseURL:(NSURL *)url;


- (void)facebookAccountVerification : (NSString *)parameter completion:(void (^)(NSMutableDictionary *message, NSError *error))completion;

- (void)getFaceBookInfoFromGraphAPI : (NSString *)accessToken completion:(void (^)(NSMutableDictionary *message, NSError *error))completion;

- (void)SignUpUserViaFacebook : (NSMutableDictionary *)parameter completion:(void (^)(NSMutableDictionary *message, NSError *error))completion;


@end
