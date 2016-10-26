//
//  ShowAllVenue.m
//  KobeSample
//
//  Created by Beryl Systems on 03/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "ShowAllVenue.h"
#import "UIImageView+AFNetworking.h"
#import "REFrostedViewController.h"

@interface ShowAllVenue ()

@end

@implementation ShowAllVenue

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self.navigationItem setHidesBackButton:YES];
    self.title = @"Venues List";
    self.m_arrInfo = [[NSMutableArray alloc] init];
    self.tags = @"";

}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.m_arrInfo removeAllObjects];
    NSLog(@"array from search:: %@",self.arrSelectedTags);
    NSLog(@"string from searchViewController %@",self.tags);
    if(self.arrSelectedTags.count)
        self.tags = [self.arrSelectedTags componentsJoinedByString:@","];
    else
        self.tags = @"";
    NSLog(@" passing tags is : %@",self.tags);
    [self showAllVenue];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)onMenuButtonPressed:(id)sender
{
    [self.frostedViewController presentMenuViewController];
}

-(NSMutableDictionary *)setJsonDataForVenue
{
    NSMutableDictionary *dicFinal =[[NSMutableDictionary alloc]init];
    NSMutableDictionary *dicData = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *dictAttributes = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *dicMessage = [[NSUserDefaults standardUserDefaults]objectForKey:@"userdata"];
    userInfo *objUserInfo = [[userInfo alloc]initWithData:dicMessage];
    NSLog(@"objUserInfo is => %@",objUserInfo.m_id);
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSString *latitude = [NSString stringWithFormat:@"%f",appDelegate.m_currentCoordinate.latitude];
    NSString *longitude = [NSString stringWithFormat:@"%f",appDelegate.m_currentCoordinate.longitude];
    [dictAttributes setObject:@"1" forKey:@"page_no"];
    [dictAttributes setObject:latitude forKey:@"longitude"];
    [dictAttributes setObject:longitude forKey:@"latitude"];
    [dictAttributes setObject:self.tags forKey:@"tags"];
    [dicData setObject:dictAttributes forKey:@"attributes"];
    [dicData setObject:objUserInfo.m_id forKey:@"id"];
    [dicFinal setObject:dicData forKey:@"data"];
    NSLog(@"dicFinal is = %@",dicFinal);
    return dicFinal;
}


-(void)showAllVenue
{
    NGAPIClient *client = [NGAPIClient sharedHTTPClient];
    [client showAllVenues : [self setJsonDataForVenue] completion:^(NSMutableDictionary *message, NSError *error)
     {
         if(error)
         {
             NSLog(@"Something bad happend. Please try again.");
             [MBProgressHUD hideHUDForView:self.view animated:YES];

         }
         else
         {
             [MBProgressHUD hideHUDForView:self.view animated:YES];
//             NSLog(@" showAllVenue message is => %@",message);
             NSString *status =  [Utility  getFormattedValue:[message objectForKey:@"status"]];
             NSString *errorCode =  [Utility  getFormattedValue:[message objectForKey:@"error_code"]];
//             NSLog(@"error code is => %@",errorCode);
//             NSLog(@"status %@",status);
             if(status)
             {
                 NSArray *arrData = [Utility getFormattedValue:[message objectForKey:@"venues"]];
                 NSLog(@"data is=> %@",arrData);
                 for (NSDictionary *dicVenues in arrData) {
                     venueInfo *objVenue = [[venueInfo alloc]initWithVenueData:dicVenues];
                     [self.m_arrInfo addObject:objVenue];
                 }
                 NSLog(@"array count is => %ld",(long)_m_arrInfo.count);
//                 [[NSUserDefaults standardUserDefaults]setObject:message forKey:@"venues"];
//                 [[NSUserDefaults standardUserDefaults]synchronize];
             }
             else
             {
                 NSLog(@"Status not matched");
             }
             [_tableview reloadData];
         }
     }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.m_arrInfo.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:@"CustomViewCell"];
    venueInfo *data = (venueInfo *) [_m_arrInfo objectAtIndex:indexPath.row];
//    NSLog(@"m_name is => %@",data.m_name);
    customCell.selectionStyle = UITableViewCellSelectionStyleNone;
//    NSLog(@"url of image is => %@",[data.m_imageURL objectAtIndex:0]);
    [customCell.m_imgview setImageWithURL:[NSURL URLWithString:[data.m_imageURL objectAtIndex:0]] placeholderImage:[UIImage imageNamed:@"pin"]];
    UIFont* boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
    customCell.m_lblName.text = data.m_name;
    [customCell.m_lblName setFont:boldFont];
    customCell.m_lblAddress.text = data.m_address;
    customCell.m_lblDistance.text = [data.m_distance stringByAppendingPathComponent:@"miles"];
    return customCell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailsViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
    venueInfo *data = (venueInfo *) [_m_arrInfo objectAtIndex:indexPath.row];
    detailVC.data = data;
    [self.navigationController pushViewController:detailVC animated:YES];
    [_tableview reloadData];
}


- (IBAction)onVenueListButtonPressed:(id)sender
{
    NSLog(@"Venue list button pressed");
   
}


- (IBAction)onSearchButtonPressed:(id)sender
{
    NSLog(@"Search button pressed");
    SearchViewController *searchVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchViewController"];
    if(self.tags.length)
    searchVC.arrSelected = self.arrSelectedTags;
    [self.navigationController pushViewController:searchVC animated:NO];
}


- (IBAction)onMapButtonPressed:(id)sender
{
    AllVenueMapViewController *mapVC = [self.storyboard instantiateViewControllerWithIdentifier:@"AllVenueMapViewController"];
    mapVC.arrVenueData = self.m_arrInfo;
    [self.navigationController pushViewController:mapVC animated:YES];
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
