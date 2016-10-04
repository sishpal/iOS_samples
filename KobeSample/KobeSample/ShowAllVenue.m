//
//  ShowAllVenue.m
//  KobeSample
//
//  Created by Beryl Systems on 03/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "ShowAllVenue.h"
#import "UIImageView+AFNetworking.h"

@interface ShowAllVenue ()

@end

@implementation ShowAllVenue

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.navigationController.navigationBar.translucent = NO;
    self.m_arrInfo = [[NSMutableArray alloc] init];
     [self.navigationItem setHidesBackButton:YES];
    [self showAllVenue];
    self.title = @"Venues List";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableDictionary *)setJsonDataForVenue
{
    NSMutableDictionary *dicFinal =[[NSMutableDictionary alloc]init];
    NSMutableDictionary *dicData = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *dictAttribute = [[NSMutableDictionary alloc]init];
    
    NSMutableDictionary *dicMessage = [[NSUserDefaults standardUserDefaults]objectForKey:@"userdata"];
    NSDictionary *dicUser1 = [Utility getFormattedValue:[dicMessage objectForKey:@"user"]];
    NSLog(@"user info is  => %@",dicUser1);
    
    NSDictionary *dicData1 = [Utility getFormattedValue:[dicUser1 objectForKey:@"data"]];
    NSLog(@"user data is => %@",dicData1);
    
    userInfo *objUserInfo = [[userInfo alloc]initWithData:dicData1];
    NSLog(@"objUserInfo is => %@",objUserInfo.m_id);
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSString *latitude = [NSString stringWithFormat:@"%f",appDelegate.m_currentCoordinate.latitude];
    NSString *longitude = [NSString stringWithFormat:@"%f",appDelegate.m_currentCoordinate.longitude];

    [dictAttribute setObject:@"1" forKey:@"page_no"];
    [dictAttribute setObject:latitude forKey:@"longitude"];
    [dictAttribute setObject:longitude forKey:@"latitude"];
    [dicData setObject:dictAttribute forKey:@"attributes"];
    [dicData setObject:objUserInfo.m_id forKey:@"id"];
    [dicFinal setObject:dicData forKey:@"data"];
    
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
         }
         else
         {
             NSLog(@" showAllVenue message is => %@",message);
             NSString *status =  [Utility  getFormattedValue:[message objectForKey:@"status"]];
             NSString *errorCode =  [Utility  getFormattedValue:[message objectForKey:@"error_code"]];
             NSLog(@"error code is => %@",errorCode);
             NSLog(@"status %@",status);
            
             NSArray *arrData = [Utility getFormattedValue:[message objectForKey:@"venues"]];
             NSLog(@"data is=> %@",arrData);
             for (NSDictionary *dicVenues in arrData) {
                 
                venueInfo *objVenue = [[venueInfo alloc]initWithVenueData:dicVenues];
                [self.m_arrInfo addObject:objVenue];
             }
             NSLog(@"array count is => %ld",(long)_m_arrInfo.count);
            
             [[NSUserDefaults standardUserDefaults]setObject:message forKey:@"venues"];
             [[NSUserDefaults standardUserDefaults]synchronize];
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
    NSLog(@"m_name is => %@",data.m_name);
    
   // UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:data.m_imageURL]];
    
 
    
   // customCell.m_imgview = data.m_imageURL;
    NSLog(@"url of image is => %@",[data.m_imageURL objectAtIndex:0]);
    
    
//    NSURL *url = [NSURL URLWithString: data.m_imageURL];
//    NSData *imgData = [NSData dataWithContentsOfURL:url];
//    UIImage *image = [UIImage imageWithData:imgData];
   // UIImage *imageView = [[UIImageView alloc] initWithImage:image];

//    NSURL *imageURL = [NSURL URLWithString:data.m_imageURL];
//    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
//    UIImage *image = [UIImage imageWithData:imageData];
    
    
     [customCell.m_imgview setImageWithURL:[NSURL URLWithString:[data.m_imageURL objectAtIndex:0]] placeholderImage:[UIImage imageNamed:@"pin"]];
    customCell.m_lblName.text = data.m_name;
    customCell.m_lblAddress.text = data.m_address;
    customCell.m_lblDistance.text = data.m_distance;
    
    return customCell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailsViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
    venueInfo *data = (venueInfo *) [_m_arrInfo objectAtIndex:indexPath.row];
    detailVC.data = data;
    [self.navigationController pushViewController:detailVC animated:YES];
}

//- (IBAction)onBackButtonPressed:(id)sender
//{
//    //[self.navigationController popViewControllerAnimated:YES];
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
