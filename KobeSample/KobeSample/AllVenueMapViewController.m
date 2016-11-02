//
//  AllVenueMapViewController.m
//  KobeSample
//
//  Created by Beryl Systems on 14/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "AllVenueMapViewController.h"

@interface AllVenueMapViewController ()

@end

@implementation AllVenueMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Venues Map";
    self.view = self.m_mapView;
    self.m_mapView.delegate = self;
    [GMSServices provideAPIKey:@"AIzaSyCQ0Pw_Zft8LFavmViQu2KLcElGDVF5q3c"];

}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self googleMap];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


- (void)googleMap {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    self.camera = [GMSCameraPosition cameraWithLatitude:appDelegate.m_currentCoordinate.latitude
                                              longitude:appDelegate.m_currentCoordinate.longitude
                                                   zoom:10];
    self.m_mapView = [GMSMapView mapWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height) camera:self.camera];
    self.m_mapView.delegate=self;
    self.m_mapView.settings.myLocationButton = NO;
    self.m_mapView.myLocationEnabled = NO;
    self.m_mapView.settings.rotateGestures = NO;
    self.m_mapView.settings.tiltGestures = NO;
    [self dropMarkerOnMap];
    
}


- (void)dropMarkerOnMap {
    [self.m_mapView clear];
    GMSMutablePath *path = [GMSMutablePath path];
    for(int i =0 ; i < self.arrVenueData.count ;i++) {
        venueInfo *venueList = (venueInfo *)[self.arrVenueData objectAtIndex:i];
        float latitude = [venueList.m_latitude floatValue];
        float longitude = [venueList.m_longitude floatValue];
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = CLLocationCoordinate2DMake(latitude,longitude);
        marker.icon = [UIImage imageNamed:@"map_marker"];
        marker.title = venueList.m_name;
        marker.snippet = venueList.m_address;
        marker.map = self.m_mapView;
        [path addCoordinate: marker.position];
    }
    GMSCoordinateBounds *bounds = [[GMSCoordinateBounds alloc] initWithPath:path];
    [_m_mapView animateWithCameraUpdate:[GMSCameraUpdate fitBounds:bounds]];

}


- (void)mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker *)marker {
//    NSLog(@"title name is %@",marker.title);
    for(int i =0 ; i < self.arrVenueData.count ;i++) {
        venueInfo *venueList = (venueInfo *)[self.arrVenueData objectAtIndex:i];
        if([marker.title isEqualToString:venueList.m_name]) {
            NSLog(@"venuelist.name is %@",venueList.m_name);
            DetailsViewController *venueData = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
            venueData.data = venueList;
            [self.navigationController pushViewController:venueData animated:YES];
        }
    }
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
