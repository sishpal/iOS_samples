//
//  DataHolder.h
//  ParsingJsonData
//
//  Created by Beryl Systems on 27/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataHolder : NSObject
@property (nonatomic, strong) NSString *m_Name;
@property (nonatomic, strong) NSString *m_isOpen;
@property (nonatomic, strong) NSString *m_Address;
@property (nonatomic, strong) NSString *m_Distance;
@property (nonatomic, strong) NSDictionary *value;
@property (nonatomic, strong) NSString *m_Description;
@property (nonatomic, strong) NSArray *m_Hours;




-(id)initWithData:(NSDictionary *)value;


@end
