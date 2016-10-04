//
//  MapViewController.h
//  KobeSample
//
//  Created by Beryl Systems on 04/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) venueInfo *holder;
@property (nonatomic, assign) CLLocationCoordinate2D m_coordinate;
@property (nonatomic, strong) IBOutlet MKMapView *mapView;

@end
