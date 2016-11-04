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


- (void)getUserInfo : (NSMutableDictionary *)parameter completion:(void (^)(NSMutableDictionary *message, NSError *error))completion;

- (void)showAllVenues : (NSMutableDictionary *)parameter completion:(void (^)(NSMutableDictionary *message, NSError *error))completion;

-(void)showVenueDetails : (NSMutableDictionary *)parameter : (NSString *)venueId completion:(void (^)(NSMutableDictionary *message, NSError *error))completion;

- (void)getTagList : (NSString *)parameter completion:(void (^)(NSMutableDictionary *message, NSError *error))completion;

- (void)profileEdit : (NSMutableDictionary *)parameter completion:(void (^)(NSMutableDictionary *message, NSError *error))completion;

- (void)facebookAccountVerification : (NSString *)parameter completion:(void (^)(NSMutableDictionary *message, NSError *error))completion;

- (void)getFaceBookInfoFromGraphAPI : (NSString *)accessToken completion:(void (^)(NSMutableDictionary *message, NSError *error))completion;

- (void)SignUpUserViaFacebook : (NSMutableDictionary *)parameter completion:(void (^)(NSMutableDictionary *message, NSError *error))completion;

- (void)getUserInfoForLogIn : (NSMutableDictionary *)parameter completion:(void (^)(NSMutableDictionary *message, NSError *error))completion;

- (void)getNotification : (NSString *)parameter completion:(void (^)(NSMutableDictionary *message, NSError *error))completion;

- (void)showAllVenuesName : (NSString *)parameter completion:(void (^)(NSMutableDictionary *message, NSError *error))completion;


@end
