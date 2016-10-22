//
//  NotificationInfo.h
//  KobeSample
//
//  Created by Beryl Systems on 22/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NotificationInfo : NSObject
@property (nonatomic, strong) NSString *m_Description;
@property (nonatomic, strong) NSString *m_Time;
@property (nonatomic, strong) NSString *m_VenueId;

-(id)initWithNotificationData:(NSDictionary *)dicData;
@end
