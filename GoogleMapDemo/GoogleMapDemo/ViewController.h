//
//  ViewController.h
//  GoogleMapDemo
//
//  Created by Beryl Systems on 24/10/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface ViewController : UIViewController <GMSMapViewDelegate>


@property (nonatomic, strong) IBOutlet GMSMapView *m_mapView;


@end

