//
//  AppDelegate.m
//  ParsingJsonData
//
//  Created by Beryl Systems on 27/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self startUpdatingCurrentLocation];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (void)startUpdatingCurrentLocation
{
    if ([CLLocationManager locationServicesEnabled])
    {
        if(_m_locationManager == nil)
        {
            _m_locationManager = [[CLLocationManager alloc] init];
            _m_locationManager.delegate = self;
        }
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
            [self.m_locationManager requestWhenInUseAuthorization];
        [_m_locationManager startUpdatingLocation];
    }
    else
    {
        // show message
        
        NSString *sMessage = [NSString stringWithFormat:@"Turn On Location Services to Allow \"%@\" to Determine Your Location",kAppName];
        UIAlertView *alertvw = [[UIAlertView alloc]initWithTitle:sMessage message:@"We use this to get your current location and improve our services." delegate:self cancelButtonTitle:@"Settings" otherButtonTitles:@"Cancel", nil];
        alertvw.tag = 100;
        [alertvw show];
    }
}


#pragma mark -
#pragma mark CLLocationManagerDelegate Methods

// Called when the location is updated

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    // Horizontal coordinates
    if (signbit(newLocation.horizontalAccuracy))
    {
        // Negative accuracy means an invalid or unavailable measurement
    }
    else
    {
        /////////// Update location of the user found.
        
        self.m_currentCoordinate = newLocation.coordinate;
        NSLog(@" value of latitude and longitude are =>%f %f",self.m_currentCoordinate.latitude,self.m_currentCoordinate.longitude);
        //self.isLocationAvailable = YES;
        
        [self.m_locationManager stopUpdatingLocation];
        
    }
    
}


// Called when there is an error getting the location
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    //self.isLocationAvailable = NO;
    
    NSString *sErrorString = nil;
    
    if ([error domain] == kCLErrorDomain)
    {
        // We handle CoreLocation-related errors here
        switch ([error code])
        {
            case kCLErrorLocationUnknown:
                sErrorString = [NSString stringWithFormat:NSLocalizedString(@"Your location could not be determined.", @"")];
                break;
            case kCLErrorDenied:
                sErrorString = [NSString stringWithFormat:NSLocalizedString(@"denied.",@"")];
                break;
                
            default:
                sErrorString = [NSString stringWithFormat:NSLocalizedString(@"Unknown location.",@"")];
                break;
        }
    }
    
    if(sErrorString)
    {
        NSLog(@"error: %@", sErrorString);
    }
    if (error.code == kCLErrorDenied)
    {
        NSString *sMessage = [NSString stringWithFormat:@"Turn On Location Services to Allow \"%@\" to Determine Your Location",kAppName];
        UIAlertView *alertvw = [[UIAlertView alloc]initWithTitle:sMessage message:@"We use this to get your current location and improve our services." delegate:self cancelButtonTitle:@"Settings" otherButtonTitles:@"Cancel", nil];
        alertvw.tag = 100;
        [alertvw show];
        
    }
}

@end
