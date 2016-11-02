//
//  MapViewController.m
//  KobeSample
//
//  Created by Beryl Systems on 04/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize m_coordinate;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Map";
    float latitude = [self.holder.m_latitude floatValue];
    float longitude = [self.holder.m_longitude floatValue];
    NSString *name = self.holder.m_name;
    NSString *address = self.holder.m_address;
    [GMSServices provideAPIKey:@"AIzaSyCQ0Pw_Zft8LFavmViQu2KLcElGDVF5q3c"];
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:latitude
                                                            longitude:longitude
                                                                 zoom:7];
    self.m_mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    self.m_mapView.myLocationEnabled = YES;
    self.view = self.m_mapView;
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(latitude, longitude);
    marker.title = name;
    marker.snippet = address;
    marker.map = self.m_mapView;
    self.m_mapView.delegate = self;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}


- (IBAction)onBackButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
