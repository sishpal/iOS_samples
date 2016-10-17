//
//  LaunchViewController.m
//  KobeSample
//
//  Created by Beryl Systems on 03/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "LaunchViewController.h"
#import "RootViewController.h"

@interface LaunchViewController ()

@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"called");
    [self.navigationItem setHidesBackButton:YES];
    NSMutableDictionary *dicMessage = [[NSUserDefaults standardUserDefaults]objectForKey:@"userdata"];
    NSLog(@"dicData is -> %@",dicMessage);
    if(dicMessage != nil)
    {
        NSLog(@"Present on showAllVenues");
        RootViewController *showallvenuevC = [self.storyboard instantiateViewControllerWithIdentifier:@"rootController"];
        [self presentViewController:showallvenuevC animated:YES completion:nil];
    }
    else
    {
        NSLog(@"Push on ViewController for Sign In or Register");
        ViewController *vC = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        [self.navigationController pushViewController:vC animated:NO];
        
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
