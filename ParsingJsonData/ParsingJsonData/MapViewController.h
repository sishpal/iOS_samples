//
//  MapViewController.h
//  ParsingJsonData
//
//  Created by Beryl Systems on 29/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface MapViewController : UIViewController <MKMapViewDelegate>
@property(nonatomic, retain) MKMapView* mapView;


@end
