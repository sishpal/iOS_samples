//
//  MapViewController.m
//  PlaceAutoComplete
//
//  Created by Beryl Systems on 02/11/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Map";
    NSString *address = self.address;
    float latitude = [self.latitude floatValue];
    float longitude = [self.longitude floatValue];
    
    [GMSServices provideAPIKey:@"AIzaSyA33uGiH_COA1lnaItK1Rp1zFS7gWiDs6Q"];
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:latitude
                                                            longitude:longitude
                                                                 zoom:7];
    self.m_mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    self.m_mapView.myLocationEnabled = YES;
    self.view = self.m_mapView;
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(latitude, longitude);
    marker.title = address;
    marker.map = self.m_mapView;
    self.m_mapView.delegate = self;

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
