//
//  AppDelegate.h
//  KobeSample
//
//  Created by Prashant Aggarwal on 10/1/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>

@property (nonatomic, retain) CLLocationManager *m_locationManager;
@property (nonatomic, assign) CLLocationCoordinate2D m_currentCoordinate;
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) UIViewController *topViewController;


@end

