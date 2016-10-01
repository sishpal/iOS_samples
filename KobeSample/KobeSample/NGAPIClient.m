
//
//  NGAPIClient.m
//  EventFinder
//
//  Created by Prashant Aggarwal on 11/7/15.
//  Copyright © 2015 Prashant Aggarwal. All rights reserved.
//

#import "NGAPIClient.h"
#import "JSONResponseSerializerWithData.h"


static NSString *const APIURLString = kBaseURl;
static NSString *const contentType = @"application/json";//@"application/vnd.api+json";
static NSString *const apiVersion = @"application/vnd.kobe.v1";

@implementation NGAPIClient

+ (NGAPIClient *)sharedHTTPClient
{
    static NGAPIClient *_sharedHTTPClient = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedHTTPClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:APIURLString]];
        _sharedHTTPClient.responseSerializer = [JSONResponseSerializerWithData serializer];
    });
    
    return _sharedHTTPClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    
    if (self) {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    return self;
}

#pragma mark - Authentication


- (void)getUserInfo : (NSMutableDictionary *)parameter completion:(void (^)(NSMutableDictionary *message, NSError *error))completion
{
    NSString *path = @"users";
   // [self.requestSerializer setValue:@"1e6f2fb7bde87dd3dededd4727684618" forHTTPHeaderField:@"Authorization"];
    [self.requestSerializer setValue:contentType forHTTPHeaderField:@"Content-Type"];
    [self.requestSerializer setValue:apiVersion forHTTPHeaderField:@"Accept"];
    [self POST:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        completion(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
}


@end
