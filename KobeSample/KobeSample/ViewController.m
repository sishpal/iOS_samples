//
//  ViewController.m
//  KobeSample
//
//  Created by Prashant Aggarwal on 10/1/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.translucent = NO;
//    self.arrTagInfo = [[NSMutableArray alloc] init];
    
//    NSLog(@"Program run");
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Test" ofType:@"json"];
//    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:filePath];
//    NSError *error = nil;
//    self.m_jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
//    NSLog(@"%@", self.m_jsonDict);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)onRegisterButtonPressed:(id)sender
{
    NSLog(@"Register button pressed");
    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
