//
//  SearchViewController.m
//  KobeSample
//
//  Created by Beryl Systems on 05/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.arrTagInfo = [[NSMutableArray alloc] init];
    self.arrVenuesName = [[NSMutableArray alloc] init];
    self.arrFinal = [[NSMutableArray alloc]init];
    self.arrSelectedTagInfo = [[NSMutableArray alloc] init];
    self.m_txtSearchViaResturent.layer.borderWidth = 1;
    self.m_txtSearchViaAddress.layer.borderWidth = 1;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.m_txtSearchViaResturent.text = nil;
    [self tagList];
    self.tableview.hidden = YES;
    [self showAllVenuesName];
    // Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"array arrselectedtags is %@",self.arrSelected);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


#pragma mark
#pragma Method

-(void)tagList
{
        NGAPIClient *client = [NGAPIClient sharedHTTPClient];
        [client getTagList : @"" completion:^(NSMutableDictionary *message, NSError *error)
         {
             if(error)
             {
                 [MBProgressHUD hideHUDForView:self.view animated:YES];
                 NSLog(@"Something bad happend. Please try again.");
             }
    else
    {
//        NSLog(@"message is => %@",message);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSDictionary *tags = [Utility getFormattedValue:[message objectForKey:@"tags"]];
//        NSLog(@"tags are => %@",tags);
        NSArray *arrData = [Utility getFormattedValue:[tags objectForKey:@"data"]];
//        NSLog(@"data is=> %@",arrData);
        for (NSDictionary *dicData in arrData) {
            tagInfo *objtagInfo = [[tagInfo alloc]initWithData:dicData];
            [self.arrTagInfo addObject:objtagInfo];
        }
//        NSLog(@"count of array is -> %ld",(long)_arrTagInfo.count);
        [_collectionView reloadData];
    }
     }];
}


#pragma mark
#pragma UICollectionView Delegates and DataSource


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _arrTagInfo.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    cell.layer.cornerRadius = 40/2;
    cell.backgroundColor = [UIColor blueColor];
    tagInfo *data = (tagInfo *) [_arrTagInfo objectAtIndex:indexPath.row];
    cell.m_lblTagName.textColor = [UIColor whiteColor];
    cell.m_lblTagName.text = data.m_Name;
    if(self.flag)
    {
        for (NSString *tagname in self.arrSelectedTagInfo) {
            if([tagname isEqualToString:data.m_Name])
            {
                cell.backgroundColor = [UIColor orangeColor];
            }
        }
    }
    NSLog(@"arrSelectedtags are %@",self.arrSelected);
    NSLog(@"data.name is %@",data.m_Name);
    if(self.arrSelected)
    {
        for (NSString *tagName in self.arrSelected) {
            if([tagName isEqualToString:data.m_Name])
            {
                cell.backgroundColor = [UIColor orangeColor];
            }
        }
        self.arrSelectedTagInfo = self.arrSelected;
    }
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.flag = YES;
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.layer.cornerRadius = 40/2;
    tagInfo *data = (tagInfo *) [_arrTagInfo objectAtIndex:indexPath.row];
    if([_arrSelectedTagInfo containsObject:data.m_Name])
    {
        cell.backgroundColor = [UIColor blueColor];
        [self.arrSelectedTagInfo removeObject:data.m_Name];
    }
    else
    {
        [self.arrSelectedTagInfo addObject:data.m_Name];
        cell.backgroundColor = [UIColor orangeColor];
    }
    NSLog(@"array is => %@",_arrSelectedTagInfo);
}


-(void)showAllVenuesName
{
    NGAPIClient *client = [NGAPIClient sharedHTTPClient];
    [client showAllVenuesName : @"" completion:^(NSMutableDictionary *message, NSError *error)
     {
         if(error)
         {
             [MBProgressHUD hideHUDForView:self.view animated:YES];
             NSLog(@"Something bad happend. Please try again(ShowAllVenuesName).");
         }
         else
         {
             NSLog(@"message from showAllVenuesName => %@",message);
             [MBProgressHUD hideHUDForView:self.view animated:YES];
             NSArray *arrData = [Utility getFormattedValue:[message objectForKey:@"venues"]];
             NSLog(@"arrdata from showAllVenuesName=> %@",arrData);
             for (NSDictionary *dicData in arrData) {
                 VenuesName *objtagInfo = [[VenuesName alloc]initWithData:dicData];
                 [self.arrVenuesName addObject:objtagInfo];
             }
             NSLog(@"count of array from showAllVenuesName -> %ld",(long)_arrVenuesName.count);
         }
     }];
}

#pragma mark
#pragma tableview Delegates and DataSource.


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(_arrFinal.count>0)
        return _arrFinal.count;
    else
    return self.arrVenuesName.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    if(_arrFinal.count>0) {
        VenuesName *data = (VenuesName *) [_arrFinal objectAtIndex:indexPath.row];
        customCell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSLog(@"value of entered text is := %@",self.myString);
        NSLog(@"data.m_name %@",data.m_Name);
        customCell.m_lblName.text = data.m_Name;
        
    }
    else {
        VenuesName *data = (VenuesName *) [_arrVenuesName objectAtIndex:indexPath.row];
        customCell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSLog(@"value of entered text is := %@",self.myString);
        customCell.m_lblName.text = data.m_Name;
    }
    return customCell;
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField           // became first responder
{
    NSLog(@"array arrvenuesname is %ld",_arrVenuesName.count);
    [self.tableview reloadData];
    self.tableview.hidden = NO;
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    self.myString = [self.m_txtSearchViaResturent.text stringByReplacingCharactersInRange:range withString:string];
    return YES;
    
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    NSLog(@"mstr %@",_myString);
    [self sortedData:_myString];
    return YES;
}
-(void)sortedData:(NSString *)myString
{
    [_arrFinal removeAllObjects];
    NSLog(@"mystring is %@",myString);
    for (VenuesName *data in self.arrVenuesName) {
        NSLog(@"value of data %@",data.m_Name);
        if([data.m_Name isEqualToString:myString])
        {
            [self.arrFinal addObject:data];
        }
        [self.tableview reloadData];
    }


}




- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    self.tableview.hidden = YES;
    [textField resignFirstResponder];
    NSLog(@"retun called");
    return YES;
}


- (IBAction)onSearchButtonPressed:(id)sender
{
    NSLog(@"Search Button Pressed");
}


- (IBAction)onBackButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)onVenueListButtonPressed:(id)sender
{
    for (UIViewController *controller in self.navigationController.viewControllers)
    {
        if ([controller isKindOfClass:[ShowAllVenue class]])
        {
            ShowAllVenue *showAllVenueVC = (ShowAllVenue *)controller;
            showAllVenueVC.arrSelectedTags = self.arrSelectedTagInfo;
            [self.navigationController popToViewController:showAllVenueVC
                                                  animated:YES];
            break;
        }
    }
}


//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
//{
//    NSLog(@"entered value %@",self.m_searchView.text);
//    return YES;
//}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
