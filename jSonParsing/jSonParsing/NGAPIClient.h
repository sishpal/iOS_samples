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


- (void)getTagList : (NSString *)parameter completion:(void (^)(NSMutableDictionary *message, NSError *error))completion;

@end
