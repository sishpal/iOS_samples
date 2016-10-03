//
//  ShowAllVenue.m
//  KobeSample
//
//  Created by Beryl Systems on 03/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "ShowAllVenue.h"

@interface ShowAllVenue ()

@end

@implementation ShowAllVenue

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self showAllVenue];
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

             
         }
     }];
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
