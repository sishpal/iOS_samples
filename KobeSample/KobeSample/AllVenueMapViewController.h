//
//  AllVenueMapViewController.h
//  KobeSample
//
//  Created by Beryl Systems on 14/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "DetailsViewController.h"


@interface AllVenueMapViewController : UIViewController <GMSMapViewDelegate>
@property (nonatomic, strong) NSString *m_longitude;
@property (nonatomic, strong) NSString *m_latitude;
@property (nonatomic, strong) NSString *m_address;
@property (nonatomic, strong) NSString *m_name;
@property (nonatomic, assign) CLLocationCoordinate2D m_coordinate;
@property (nonatomic, strong) GMSCameraPosition *camera;
@property (nonatomic, strong) IBOutlet GMSMapView *m_mapView;
@property (nonatomic, assign) NSArray *arrinfo;
@property (nonatomic, assign) NSArray *arrVenueData;



@end
