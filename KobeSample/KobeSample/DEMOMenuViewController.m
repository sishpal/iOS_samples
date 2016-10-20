//
//  DEMOMenuViewController.m
//  REFrostedViewControllerStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "DEMOMenuViewController.h"
#import "UIViewController+REFrostedViewController.h"
#import "DEMONavigationController.h"
#import "MenuViewCell.h"
#import "HeaderViewCell.h"
//#import "ProfileViewController.h"
#import "userInfo.h"


@interface DEMOMenuViewController ()<UIAlertViewDelegate>

@end

@implementation DEMOMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.opaque = YES;
    //self.tableView.backgroundColor = [UIColor whiteColor];//[UIColor colorWithWhite:0.80 alpha:1.0];
    self.tableView.frame = CGRectMake(self.tableView.frame.origin.x, self.tableView.frame.origin.y, self.tableView.frame.size.width - 100, self.tableView.frame.size.height);
    self.arrMenuTitle = [[NSMutableArray alloc]initWithObjects:@"Subscription",@"Notifications",@"How it works",@"Earn free drinks",@"FAQ",@"About",@"Share With",@"Logout", nil];
    self.arrData = [[NSMutableArray alloc] init];

    
    /*
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    LogoutView *vw = [Utility getViewFromXib:@"LogoutView" classname:[LogoutView class] owner:self];
    vw.frame = CGRectMake(0, screenRect.size.height - 50, screenRect.size.width - 100, 50);
    [vw.m_btnLogout addTarget:self action:@selector(onLogOutButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:vw];
     */
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (IBAction)onLogOutButtonPressed:(id)sender
{
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Log out" message:@"Are you sure?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Yes", nil];
    [alertView show];
}

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
    cell.textLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:17];
    cell.textLabel.tintColor = [UIColor whiteColor];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex
{
    if (sectionIndex == 0)
        return 0;
    
    return 34;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if(indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4 || indexPath.row == 5)
    {
        NSLog(@"Select row for push on AfterMenuViewController");
        AfterMenuViewController *profileVC = [self.storyboard instantiateViewControllerWithIdentifier:@"AfterMenuViewController"];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:profileVC];
        [self presentViewController:nav animated:YES completion:nil];
        [self.frostedViewController hideMenuViewController];
    }
    if(indexPath.row == 0)
    {
      
        NSLog(@"Push on updateUserInfo page");
        UpdateUserInfoViewController *updateUserVC = [self.storyboard instantiateViewControllerWithIdentifier:@"UpdateUserInfoViewController"];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:updateUserVC];
        [self presentViewController:nav animated:YES completion:nil];
        [self.frostedViewController hideMenuViewController];
    }
    if(indexPath.row == 6)
    {
        NSLog(@"Share With is selected");
        ShareWithViewController *shareWithVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ShareWithViewController"];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:shareWithVC];
        [self presentViewController:nav animated:YES completion:nil];
        [self.frostedViewController hideMenuViewController];
        
    }
    if(indexPath.row == 7)
    {
        NSLog(@"logout pressed");
        [[NSUserDefaults standardUserDefaults]setObject:nil forKey:@"userdata"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        ViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:detailVC];
        [self presentViewController:nav animated:YES completion:nil];
        [self.frostedViewController hideMenuViewController];
    }
}


#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        return 170;
    }
    else
    {
        return 45;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return self.arrMenuTitle.count;//[DataManager getMenuArray].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    NSString *cellIdentifier = @"HeaderViewCell";
//    HeaderViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    cell.m_lblName.text = @"Hello";
//    return cell;
    
    if(indexPath.row == 0)
    {
        NSString *cellIdentifier = @"HeaderViewCell";
        HeaderViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        NSMutableDictionary *dictData = [[NSUserDefaults standardUserDefaults]objectForKey:@"userdata"];
        cell.m_profileImage.layer.cornerRadius = 50;
        cell.m_profileImage.layer.masksToBounds = YES;
        cell.m_profileImage.clipsToBounds = YES;
        //cell.m_profileImage.maj
    
        if(dictData!=nil)
        {
            userInfo *info = [[userInfo alloc]initWithData:dictData];
            cell.m_lblName.text = [NSString stringWithFormat:@"%@ %@",info.m_firstName,info.m_lastName];
            NSLog(@"image url is => %@",info.m_image);
            
            [cell setCellData:info.m_image];
        
//            [cell.m_profileImage setImageWithURL:[NSURL URLWithString: info.m_image] placeholderImage:[UIImage imageNamed:@"download"]];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
    }
    
    else
    {
        NSString *cellIdentifier = @"MenuViewCell";
        MenuViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        cell.m_lblTitle.text = [self.arrMenuTitle objectAtIndex:indexPath.row];
        //  NSString *sImageName = [NSString stringWithFormat:@"menu_%@",[self.arrMenuTitle objectAtIndex:indexPath.row-1]];
       // cell.m_menuImage.image = [UIImage imageNamed:sImageName];
        [cell.vwSeperator setHidden:YES];
        return cell;
    }
}





#pragma mark
#pragma mark - MailController

/*
- (void)showSupportMailComposer
{
    //[[UINavigationBar appearance] setTranslucent:NO];
    if (![MFMailComposeViewController canSendMail])
    {
        [Utility showAlertWithTitle:@"Error" withMessage:@"No mail accounts found"];
    }
    
    else
    {
        MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc] init];
        [mailController setMailComposeDelegate:self];
        
//        [[mailController navigationBar] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"HelveticaNeue-Medium" size:18],NSFontAttributeName, [UIColor whiteColor], NSForegroundColorAttributeName, nil]];
//        [[mailController navigationBar] setTintColor: [UIColor whiteColor]];
        [mailController setToRecipients:[NSArray arrayWithObject:@"support@hooch.com"]];
        [mailController setSubject:[NSString stringWithFormat:@"%@ Support",kAppName]];
        [self  presentViewController:mailController animated:YES completion:^{
            // [[mailController navigationBar] setTranslucent:YES];
            //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
            
        }];
        
    }
}
*/
#pragma mark
#pragma mark - MailComposer Delegates

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
