//
//  AllVenueMapViewController.h
//  KobeSample
//
//  Created by Beryl Systems on 14/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface AllVenueMapViewController : UIViewController <MKMapViewDelegate>
@property (nonatomic, strong) NSString *m_longitude;
@property (nonatomic, strong) NSString *m_latitude;
@property (nonatomic, strong) NSString *m_address;
@property (nonatomic, strong) NSString *m_name;
@property (nonatomic, assign) CLLocationCoordinate2D m_coordinate;
@property (nonatomic, strong) IBOutlet MKMapView *mapView;

@end
