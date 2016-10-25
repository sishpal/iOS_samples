//
//  DetailsViewController.m
//  KobeSample
//
//  Created by Beryl Systems on 04/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Venue";
    // Do any additional setup after loading the view.
//    NSLog(@"Selected name is => %@",self.data.m_name);
//    NSLog(@"Selected latitude is => %@",self.data.m_latitude);
//    NSLog(@"Selected address is => %@",self.data.m_address);
//    NSLog(@"Selected description is=> %@",self.data.m_description);
//    NSLog(@"Selected hours is => %@",[self.data.m_workingHours componentsJoinedByString:@"\n"]);
//    NSLog(@"value of is_open is => %@",self.data.m_isOpen);
    NSLog(@"Venue id is=> %@",self.m_venueId);
    if([self.data.m_isOpen isEqualToString:@"1"])
        self.isOpen = @"OPEN NOW";
    else
        self.isOpen = @"CLOSE NOW";
    self.m_btnRedeem.layer.cornerRadius = 50/2;
    self.m_tableView.estimatedRowHeight = 50;
    self.m_tableView.rowHeight = UITableViewAutomaticDimension;
    [self showVenueDetails];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSMutableDictionary *)setJsonDataForVenueDetails
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
    [dictAttributes setObject:latitude forKey:@"longitude"];
    [dictAttributes setObject:longitude forKey:@"latitude"];
    [dicData setObject:objUserInfo.m_id forKey:@"user_id"];
    [dicData setObject:dictAttributes forKey:@"attributes"];
    [dicFinal setObject:dicData forKey:@"data"];
    return dicFinal;
}



-(void)showVenueDetails
{
    NGAPIClient *client = [NGAPIClient sharedHTTPClient];
    [client showVenueDetails : [self setJsonDataForVenueDetails] : self.m_venueId completion:^(NSMutableDictionary *message, NSError *error)
     {
         if(error)
         {
             NSLog(@"Something bad happend. Please try again.");
             [MBProgressHUD hideHUDForView:self.view animated:YES];
             
         }
         else
         {
             [MBProgressHUD hideHUDForView:self.view animated:YES];
                          NSLog(@" show Venue Details message is => %@",message);
             NSString *status =  [Utility  getFormattedValue:[message objectForKey:@"status"]];
             NSString *errorCode =  [Utility  getFormattedValue:[message objectForKey:@"error_code"]];
                          NSLog(@"error code is => %@",errorCode);
                          NSLog(@"status %@",status);
             
             NSMutableDictionary *dicVenues = [Utility getFormattedValue:[message objectForKey:@"venues"]];
             NSMutableDictionary *dicData = [Utility getFormattedValue:[dicVenues objectForKey:@"data"]];
            venueInfo *venueData = [[venueInfo alloc]initWithVenueData:dicData];
            self.data = venueData;
             [_m_tableView reloadData];
         }
     }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"Set Cell Size");
    if(indexPath.row == 0)
    {
        return 60.0;
    }else if(indexPath.row == 1)
    {
        return 140.0;
    }else if(indexPath.row == 2)
    {
        return UITableViewAutomaticDimension;
    }
    else
    {
        return UITableViewAutomaticDimension;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.row == 0)
    {
        CustomDetailsViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"nameAndAddress"];
        Cell.m_lblName.text = self.data.m_name;
        Cell.m_lblAddress.text = self.data.m_address;
        Cell.m_lblDistance.text = [self.data.m_distance stringByAppendingPathComponent:@"miles"];
        Cell.m_lblIsOpen.text = _isOpen;
        Cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return Cell;
    }
    else if(indexPath.row == 1)
    {
        CustomDetailsViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"image"];
        Cell.selectionStyle = UITableViewCellSelectionStyleNone;
         [Cell.m_imgview setImageWithURL:[NSURL URLWithString:[self.data.m_imageURL objectAtIndex:0]] placeholderImage:[UIImage imageNamed:@"pin"]];
        return Cell;
    }
    else if(indexPath.row == 2)
    {
        CustomDetailsViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"description"];
        Cell.m_lblDescription.text = self.data.m_description;
        Cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return Cell;
    }
    else
    {
        CustomDetailsViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"hours"];
        NSString *hours = [self.data.m_workingHours componentsJoinedByString:@"\n"];
        Cell.selectionStyle = UITableViewCellSelectionStyleNone;
        Cell.m_lblHours.text = hours;
        return Cell;
    }
}


- (IBAction)onBackButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onMapButtonPressed:(id)sender
{
    MapViewController *mapVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MapViewController"];
    mapVC.holder = self.data;
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
