//
//  tagInfo.h
//  KobeSample
//
//  Created by Beryl Systems on 06/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface tagInfo : NSObject

@property (nonatomic, strong) NSString *m_Name;
@property (nonatomic, strong) NSString *m_Id;
@property (nonatomic, strong) NSString *m_Type;
@property (nonatomic, strong) NSDictionary *value;


-(id)initWithData:(NSDictionary *)value;
@end
