//
//  MapViewController.h
//  PlaceAutoComplete
//
//  Created by Beryl Systems on 02/11/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapViewController : UIViewController
@property (nonatomic, assign) CLLocationCoordinate2D m_coordinate;
@property (nonatomic, strong) IBOutlet GMSMapView *m_mapView;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *longitude;
@property (nonatomic, strong) NSString *latitude;


@end
