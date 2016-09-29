//
//  AppDelegate.h
//  ParsingJsonData
//
//  Created by Beryl Systems on 27/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>

@property (nonatomic, retain) CLLocationManager *m_locationManager;
@property (nonatomic, assign) CLLocationCoordinate2D m_currentCoordinate;
@property (strong, nonatomic) UIWindow *window;


@end

