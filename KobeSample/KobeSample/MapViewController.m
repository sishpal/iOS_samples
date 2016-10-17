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


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Map";
//    NSLog(@"value of holder is => %@",_holder);
//    NSLog(@"Value of latitude is => %@",self.holder.m_latitude);
//    NSLog(@"Value of longitude is => %@",self.holder.m_longitude);
    float latitude = [self.holder.m_latitude floatValue];
    float longitude = [self.holder.m_longitude floatValue];
    NSString *name = self.holder.m_name;
    NSString *address = self.holder.m_address;
    MKPointAnnotation * pointAnnotation = [[MKPointAnnotation alloc] init];
    pointAnnotation.title = name;
    pointAnnotation.subtitle = address;
    m_coordinate.latitude = latitude;
    m_coordinate.longitude = longitude;
    pointAnnotation.coordinate = m_coordinate;
    [_mapView addAnnotation:pointAnnotation];
    MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:MKCoordinateRegionMakeWithDistance(m_coordinate, 200, 100)];
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
    UIImageView *myCustomImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"download"]];
    annotationView.leftCalloutAccessoryView = myCustomImage;
    return annotationView;
}


- (IBAction)onBackButtonPressed:(id)sender
{
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
