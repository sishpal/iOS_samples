//
//  DetailsViewController.m
//  Calculator
//
//  Created by Beryl Systems on 15/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark
#pragma mark - UITextField Delegates


- (IBAction)onDownButtonPressed:(id)sender
{
    NSLog(@"Down button pressed");
//    DetailsViewController *detailsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
    
//    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:detailsVC];
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
