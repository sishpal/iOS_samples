//
//  ViewController.m
//  SearchBarSample
//
//  Created by Beryl Systems on 09/11/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.m_arrName = [[NSArray alloc] init];
    self.m_arrName = [NSArray arrayWithObjects: @"BerylSystems", @"TCS", @"Wipro", @"Webkul Softwares",@"Code Brew Labs",@"JKT",@"Skilrock", nil];
    self.m_arrFinal = [[NSMutableArray alloc] init];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (self.m_isSearch) {
        return self.m_arrFinal.count;
        
    }
    else {
        return self.m_arrName.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        if (self.m_isSearch)
        {
            NSLog(@"count of arrya is := %ld",(long)self.m_arrFinal.count);
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            }

            cell.textLabel.text = [self.m_arrFinal objectAtIndex:indexPath.row];
            return cell;
        }
        else {
            CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
            cell.m_lblName.text = [self.m_arrName objectAtIndex:indexPath.row];
            return cell;
    }
    
    
}


#pragma mark
#pragma Search method


- (void)searchTableList {
    NSString *searchString = self.m_searchBar.text;
    for (NSString *tempStr in self.m_arrName) {
        NSComparisonResult result = [tempStr compare:searchString options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchString length])];
        if (result == NSOrderedSame) {
            [self.m_arrFinal addObject:tempStr];
        }
    }
    
}

#pragma mark
#pragma UISearchBar Delegates


- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    self.m_isSearch = YES;
}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"Text change - %d",self.m_isSearch);
    if(searchText.length !=0){
        
    
    //Remove all objects first.
    [self.m_arrFinal removeAllObjects];
    
    if(searchText.length != 0) {
        self.m_isSearch = YES;
        [self searchTableList];
        [self.m_tableView reloadData];
    }
    else {
        self.m_isSearch = NO;
    }
    }
}



- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"Search Clicked");
    [self searchTableList];
}

@end
