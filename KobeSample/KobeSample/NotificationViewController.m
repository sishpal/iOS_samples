//
//  NotificationViewController.m
//  KobeSample
//
//  Created by Beryl Systems on 22/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "NotificationViewController.h"

@interface NotificationViewController ()

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    self.m_arrInfo = [[NSMutableArray alloc] init];
    [self getNotifications];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onCloseButtonPressed:(id)sender
{

    [self dismissViewControllerAnimated:YES completion:nil];

}

- (void)getNotifications
{
    NGAPIClient *client = [NGAPIClient sharedHTTPClient];
    [client getNotification : @"1" completion:^(NSMutableDictionary *message, NSError *error)
     {
         if(error)
         {
             [MBProgressHUD hideHUDForView:self.view animated:YES];
             NSLog(@"error");
         }
         else
         {
             [MBProgressHUD hideHUDForView:self.view animated:YES];
             NSString *sStatus = [Utility getFormattedValue:[message objectForKey:@"status"]];
             NSString *sErrorCode = [Utility getFormattedValue:[message objectForKey:@"error_code"]];
             if([sStatus isEqualToString:@"200"] && sErrorCode.length <= 0)
             {
                 NSLog(@"message from notification API %@",message);
                 NSArray *arrData = [Utility getFormattedValue:[message objectForKey:@"notifications"]];
                 for (NSDictionary *dicNotification in arrData)
                 {
                     NotificationInfo *objNotification = [[NotificationInfo alloc]initWithNotificationData:dicNotification];
                     [self.m_arrInfo addObject:objNotification];
                 }
                 NSLog(@"value of array is %ld",(long)_m_arrInfo.count);
                 [self.m_tblView reloadData];

             }
         }
     }];    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.m_arrInfo.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NotificationViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NotificationViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NotificationInfo *data = (NotificationInfo *) [_m_arrInfo objectAtIndex:indexPath.row];
    cell.m_lblDescritpion.text = data.m_Description;
    cell.m_lblTime.text = data.m_Time;
    cell.m_lblDescritpion.textColor = [UIColor lightGrayColor];
    cell.m_lblTime.textColor = [UIColor grayColor];
    NSLog(@"cell time is %@",cell.m_lblTime.text);
    cell.m_imgView.layer.cornerRadius = 22;
    cell.m_imgView.layer.masksToBounds = YES;
    cell.m_imgView.clipsToBounds = YES;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return 76.0;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Row Selected");
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NotificationInfo *data = (NotificationInfo *)[self.m_arrInfo objectAtIndex:indexPath.row];
    DetailsViewController *detailVenueVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
    detailVenueVC.m_venueId = data.m_VenueId;
    [self.navigationController pushViewController:detailVenueVC animated:YES];
    
}

@end
