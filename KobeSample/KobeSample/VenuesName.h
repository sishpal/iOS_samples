//
//  VenuesName.h
//  KobeSample
//
//  Created by Beryl Systems on 04/11/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VenuesName : NSObject

@property (nonatomic, strong) NSString *m_Name;
@property (nonatomic, strong) NSString *m_Id;


-(id)initWithData:(NSDictionary *)value;

@end
