//
//  ViewController.m
//  PlaceAutoComplete
//
//  Created by Beryl Systems on 27/10/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.strpass = @"";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];    // Dispose of any resources that can be recreated.
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newString = [self.txtSearch.text stringByReplacingCharactersInRange:range withString:string];
    [self handleSearchForSearchString:newString];
//    [_m_tblView reloadData];
    
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"searchResultPlaces is := %@",searchResultPlaces);
    return [searchResultPlaces count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   CustomCell *customCell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
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
//            [self.searchDisplayController.searchResultsTableView reloadData];
        }
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
