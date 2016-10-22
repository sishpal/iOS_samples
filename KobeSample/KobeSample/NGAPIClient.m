
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
    [self POST:path parameters:parameter success:^(NSURLSessionDataTask *task, id responseObject) {
        completion(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
}


-(void)showAllVenues : (NSMutableDictionary *)parameter completion:(void (^)(NSMutableDictionary *message, NSError *error))completion
{
    NSString *path = @"venues";
    
     [self.requestSerializer setValue:@"1e6f2fb7bde87dd3dededd4727684618" forHTTPHeaderField:@"Authorization"];
    [self.requestSerializer setValue:contentType forHTTPHeaderField:@"Content-Type"];
    [self.requestSerializer setValue:apiVersion forHTTPHeaderField:@"Accept"];
    [self POST:path parameters:parameter success:^(NSURLSessionDataTask *task, id responseObject) {
        completion(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
}

-(void)showVenueDetails : (NSMutableDictionary *)parameter :(NSString *)venueId completion:(void (^)(NSMutableDictionary *message, NSError *error))completion
{
    NSString *path = @"venue";
    path = [path stringByAppendingPathComponent:venueId];
    [self.requestSerializer setValue:@"1e6f2fb7bde87dd3dededd4727684618" forHTTPHeaderField:@"Authorization"];
    [self.requestSerializer setValue:contentType forHTTPHeaderField:@"Content-Type"];
    [self.requestSerializer setValue:apiVersion forHTTPHeaderField:@"Accept"];
    [self GET:path parameters:parameter success:^(NSURLSessionDataTask *task, id responseObject) {
        completion(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(parameter, error);
    }];
}



- (void)getTagList : (NSString *)parameter completion:(void (^)(NSMutableDictionary *message, NSError *error))completion
{
    NSString *path = @"tags";
    [self.requestSerializer setValue:@"1e6f2fb7bde87dd3dededd4727684618" forHTTPHeaderField:@"Authorization"];
    [self.requestSerializer setValue:contentType forHTTPHeaderField:@"Content-Type"];
    [self.requestSerializer setValue:apiVersion forHTTPHeaderField:@"Accept"];
    [self GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        completion(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
}

- (void)profileEdit : (NSMutableDictionary *)parameter completion:(void (^)(NSMutableDictionary *message, NSError *error))completion
{
    NSMutableDictionary *dicMessage = [[NSUserDefaults standardUserDefaults]objectForKey:@"userdata"];
    NSLog(@"dicData is -> %@",dicMessage);
    NSMutableDictionary *dicAttributes = [Utility getFormattedValue:[dicMessage objectForKey:@"attributes"]];
    NSString *authToken = [Utility getFormattedValue:[dicAttributes objectForKey:@"auth_token"]];
    NSString *path = @"users";
    [self.requestSerializer setValue:authToken forHTTPHeaderField:@"Authorization"];
    [self.requestSerializer setValue:contentType forHTTPHeaderField:@"Content-Type"];
    [self.requestSerializer setValue:apiVersion forHTTPHeaderField:@"Accept"];
    [self PATCH:path parameters:parameter success:^(NSURLSessionDataTask *task, id responseObject) {
        completion(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
}

- (void)getFaceBookInfoFromGraphAPI : (NSString *)accessToken completion:(void (^)(NSMutableDictionary *message, NSError *error))completion
{
    NSString *sURl = [NSString stringWithFormat:@"https://graph.facebook.com/me?fields=id,name,email,first_name,last_name,birthday&access_token=%@",accessToken];
    [self GET:sURl parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        completion(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
}



- (void)facebookAccountVerification : (NSString *)parameter completion:(void (^)(NSMutableDictionary *message, NSError *error))completion
{
    NSString *path = @"account_verification";
    path = [path stringByAppendingPathComponent:parameter];
    path = [path stringByAppendingPathComponent:@"device_token/device123"];
    [self.requestSerializer setValue:contentType forHTTPHeaderField:@"Content-Type"];
    [self.requestSerializer setValue:apiVersion forHTTPHeaderField:@"Accept"];
    [self GET:path parameters:parameter success:^(NSURLSessionDataTask *task, id responseObject) {
        completion(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
}

- (void)SignUpUserViaFacebook : (NSMutableDictionary *)parameter completion:(void (^)(NSMutableDictionary *message, NSError *error))completion
{
    NSString *path = @"users/login";
    //    [self.requestSerializer setValue:@"1e6f2fb7bde87dd3dededd4727684618" forHTTPHeaderField:@"Authorization"];
    [self.requestSerializer setValue:contentType forHTTPHeaderField:@"Content-Type"];
    [self.requestSerializer setValue:apiVersion forHTTPHeaderField:@"Accept"];
    [self POST:path parameters:parameter success:^(NSURLSessionDataTask *task, id responseObject) {
        completion(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
}

- (void)getUserInfoForLogIn : (NSMutableDictionary *)parameter completion:(void (^)(NSMutableDictionary *message, NSError *error))completion
{
    NSString *path = @"users/login";
    // [self.requestSerializer setValue:@"1e6f2fb7bde87dd3dededd4727684618" forHTTPHeaderField:@"Authorization"];
    [self.requestSerializer setValue:contentType forHTTPHeaderField:@"Content-Type"];
    [self.requestSerializer setValue:apiVersion forHTTPHeaderField:@"Accept"];
    [self POST:path parameters:parameter success:^(NSURLSessionDataTask *task, id responseObject) {
        completion(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
}


- (void)getNotification : (NSString *)parameter completion:(void (^)(NSMutableDictionary *message, NSError *error))completion
{
    NSMutableDictionary *dicMessage = [[NSUserDefaults standardUserDefaults]objectForKey:@"userdata"];
    NSLog(@"dicData is -> %@",dicMessage);
    NSString *m_uId = [Utility getFormattedValue:[dicMessage objectForKey:@"id"]];

    
    NSString *path = @"notifications";
    path = [path stringByAppendingPathComponent:parameter];
    path = [path stringByAppendingPathComponent:@"user"];
    path = [path stringByAppendingPathComponent:m_uId];
    // [self.requestSerializer setValue:@"1e6f2fb7bde87dd3dededd4727684618" forHTTPHeaderField:@"Authorization"];
    [self.requestSerializer setValue:contentType forHTTPHeaderField:@"Content-Type"];
    [self.requestSerializer setValue:apiVersion forHTTPHeaderField:@"Accept"];
    [self GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        completion(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
}



@end
