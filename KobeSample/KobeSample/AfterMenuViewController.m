//
//  AfterMenuViewController.m
//  KobeSample
//
//  Created by Beryl Systems on 07/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "AfterMenuViewController.h"

@interface AfterMenuViewController ()

@end

@implementation AfterMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //        AfterMenuViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"AfterMenuViewController"];
    //        [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDoneButtonPressed:(id)sender
{
    NSLog(@"Search button pressed");
//    SearchViewController *searchVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchViewController"];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
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
