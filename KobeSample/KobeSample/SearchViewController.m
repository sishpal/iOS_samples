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
    self.arrSelectedTagInfo = [[NSMutableArray alloc] init];
    self.m_searchView.layer.borderWidth = 1;
    self.m_addressView.layer.borderWidth = 1;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self tagList];
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


//- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
//{


//}


- (IBAction)onBackButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    NSLog(@"retun called");
    return YES;
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


- (IBAction)onSearchButtonPressed:(id)sender
{
    NSLog(@"Search Button Pressed");
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
