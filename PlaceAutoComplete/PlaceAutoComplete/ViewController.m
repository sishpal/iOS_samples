//
//  ViewController.m
//  PlaceAutoComplete
//
//  Created by Beryl Systems on 27/10/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "ViewController.h"
#import "SPGooglePlacesAutocompleteQuery.h"
#import "SPGooglePlacesAutocompletePlace.h"
#import "MapViewController.h"
@interface ViewController ()


@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    searchQuery = [[SPGooglePlacesAutocompleteQuery alloc] init];
    searchQuery.radius = 1000;
    self.strpass = @"";

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];    // Dispose of any resources that can be recreated.

}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newString = [self.txtSearch.text stringByReplacingCharactersInRange:range withString:string];
    [self handleSearchForSearchString:newString];
    return YES;

}


- (SPGooglePlacesAutocompletePlace *)placeAtIndexPath:(NSIndexPath *)indexPath
{
    return [searchResultPlaces objectAtIndex:indexPath.row];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"searchResultPlaces is := %@",searchResultPlaces);
    return [searchResultPlaces count];

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *customCell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    customCell.m_lblName.text = [self placeAtIndexPath:indexPath].name;
    return customCell;

}


#pragma mark -
#pragma mark UISearchDisplayDelegate


- (void)handleSearchForSearchString:(NSString *)searchString {
    searchQuery.input = searchString;
    [searchQuery fetchPlaces:^(NSArray *places, NSError *error) {
        if (error)
        {
            SPPresentAlertViewWithErrorAndTitle(error, @"Could not fetch Places");
        }
        else
        {
            searchResultPlaces = places;
            [self.m_tblView reloadData];
        }
    }];

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SPGooglePlacesAutocompletePlace *place = [self placeAtIndexPath:indexPath];
    [place resolveToPlacemark:^(CLPlacemark *placemark, NSString *addressString, NSError *error) {
        NSLog(@"placemark %ld",(long)placemark.location.coordinate.latitude);
        if (error)
        {
            SPPresentAlertViewWithErrorAndTitle(error, @"Could not map selected Place");
        } else if (placemark)
        {
            float latitude = placemark.location.coordinate.latitude;
            float longitude = placemark.location.coordinate.longitude;
            NSLog(@"latitude is %ld",(long)latitude);
            NSLog(@"longitude is %ld",(long)longitude);
            MapViewController *mapVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MapViewController"];
            mapVC.address =[self placeAtIndexPath:indexPath].name;
            mapVC.latitude = [NSString stringWithFormat:@"%ld",(long)latitude];
            mapVC.longitude = [NSString stringWithFormat:@"%ld",(long)longitude];
            [self.navigationController pushViewController:mapVC animated:YES];
        }
    }];

}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;

}



@end
