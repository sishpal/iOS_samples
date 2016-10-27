//
//  ViewController.h
//  PlaceAutoComplete
//
//  Created by Beryl Systems on 27/10/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "CustomCell.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
{
    NSArray *searchResultPlaces;
    SPGooglePlacesAutocompleteQuery *searchQuery;    
    BOOL shouldBeginEditing;
}

@property (nonatomic, strong) IBOutlet UITextField *txtSearch;
@property (nonatomic, strong) IBOutlet UITableView *m_tblView;
@property (nonatomic, strong) NSString *strpass;

@end

