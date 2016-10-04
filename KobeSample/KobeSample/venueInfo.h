//
//  venueInfo.h
//  KobeSample
//
//  Created by Beryl Systems on 03/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface venueInfo : NSObject

@property (nonatomic, strong) NSString *m_id;
@property (nonatomic, strong) NSString *m_latitude;
@property (nonatomic, strong) NSString *m_longitude;
@property (nonatomic, strong) NSString *m_type;
@property (nonatomic, strong) NSString *m_name;
@property (nonatomic, strong) NSString *m_address;
@property (nonatomic, strong) NSMutableArray *m_imageURL;
@property (nonatomic, strong) NSString *m_description;
@property (nonatomic, strong) NSString *m_contactNumber;
@property (nonatomic, strong) NSString *m_distance;
@property (nonatomic, strong) NSString *m_isOpen;
@property (nonatomic, strong) NSMutableArray *m_workingHours;

-(id)initWithVenueData:(NSDictionary *)value;

@end
