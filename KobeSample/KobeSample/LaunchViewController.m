//
//  LaunchViewController.m
//  KobeSample
//
//  Created by Beryl Systems on 03/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "LaunchViewController.h"

@interface LaunchViewController ()

@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"called");
    NSMutableDictionary *dicMessage = [[NSUserDefaults standardUserDefaults]objectForKey:@"userdata"];
    NSLog(@"message is -> %@",dicMessage);
    if(dicMessage != nil)
    {
        NSLog(@"Push on showAllVenues");
        ShowAllVenue *showallvenuevC = [self.storyboard instantiateViewControllerWithIdentifier:@"ShowAllVenue"];
        [self.navigationController pushViewController:showallvenuevC animated:YES];
        
    }
    else
    {
        NSLog(@"Push on ViewController");
        ViewController *vC = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        [self.navigationController pushViewController:vC animated:YES];
        
    }
    

    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
