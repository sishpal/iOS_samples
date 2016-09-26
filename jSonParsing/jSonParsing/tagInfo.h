//
//  tagInfo.h
//  jSonParsing
//
//  Created by Beryl Systems on 26/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface tagInfo : NSObject
@property (nonatomic, strong) NSString *m_Name;
@property (nonatomic, strong) NSString *m_Id;
@property (nonatomic, strong) NSString *m_Type;
@property (nonatomic, strong) NSDictionary *value;


-(id)initWithData:(NSDictionary *)value;



@end
