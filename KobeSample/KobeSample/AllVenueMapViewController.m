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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Map";
    NSMutableDictionary *dicMessage = [[NSUserDefaults standardUserDefaults]objectForKey:@"venues"];
//    NSLog(@"dicData is -> %@",dicMessage);
    NSArray *arrData = [Utility getFormattedValue:[dicMessage objectForKey:@"venues"]];
//    NSLog(@"Array is => %@",arrData);
    for(NSDictionary *dicVenues in arrData)
    {
        MKPointAnnotation * pointAnnotation = [[MKPointAnnotation alloc] init];
        NSDictionary *dicAttribute = [Utility getFormattedValue:[dicVenues objectForKey:@"attributes"]];
        self.m_latitude = [Utility getFormattedValue:[dicAttribute objectForKey:@"latitude"]];
        self.m_longitude = [Utility getFormattedValue:[dicAttribute objectForKey:@"longitude"]];
        self.m_name = [Utility getFormattedValue:[dicAttribute objectForKey:@"name"]];
        self.m_address = [Utility getFormattedValue:[dicAttribute objectForKey:@"address"]];
//        NSLog(@"latitude are=> %@",_m_latitude);
//        NSLog(@"longitude are=> %@",_m_longitude);
        float latitude = [self.m_latitude floatValue];
        float longitude = [self.m_longitude floatValue];
        NSString *name = self.m_name;
        NSString *address = self.m_address;
        _m_coordinate.latitude = latitude;
        _m_coordinate.longitude = longitude;
        pointAnnotation.coordinate = _m_coordinate;
        pointAnnotation.title = name;
        pointAnnotation.subtitle = address;
        [_mapView addAnnotation:pointAnnotation];
    }
    MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:MKCoordinateRegionMakeWithDistance(_m_coordinate, 200, 100)];
    [self.mapView setRegion:adjustedRegion animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    static NSString *AnnotationViewID = @"annotationViewID";
    MKAnnotationView *annotationView = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
    
    if (annotationView == nil)
    {
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
    }
    annotationView.canShowCallout = YES;
    UIImage *img = [UIImage imageNamed:@"pin"];
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    annotationView.image = img;
    annotationView.annotation = annotation;
    return annotationView;
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
