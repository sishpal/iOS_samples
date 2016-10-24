//
//  ViewController.m
//  GoogleMapDemo
//
//  Created by Beryl Systems on 24/10/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [GMSServices provideAPIKey:@"AIzaSyDg_VI2pfIOrb9_iYqgHwqYuKL0mowOXV8"];
    //Create a GMSCameraPosition that tells the map to display the
    //coordinate 22.595769, 88.263639 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:22.595769
                                                            longitude:88.263639
                                                                 zoom:6];
    self.m_mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    self.m_mapView.myLocationEnabled = YES;
    self.view = self.m_mapView;

    //Creates a marker at kolkata location.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(22.595769, 88.263639);
    marker.title = @"Howrah";
    marker.snippet = @"Kolkata";
    marker.map = self.m_mapView;
    self.m_mapView.delegate = self;

}


- (void)mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker *)marker
{

    NSLog(@"Selected");
    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    [self.navigationController pushViewController:detailVC animated:YES];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
