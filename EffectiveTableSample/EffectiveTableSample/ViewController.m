//
//  ViewController.m
//  EffectiveTableSample
//
//  Created by Beryl Systems on 18/11/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma UITableView Delegates and Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //    NSLog(@"Set Cell Size");
    if(indexPath.row == 0) {
        return 504;
    }
    else 
        return 100;
    

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0)
    {
        ViewControllerCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"Time"];
        Cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return Cell;
    }
    else{
        ViewControllerCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"Image"];
        Cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return Cell;
    }
}

#pragma mark
#pragma UIControll Methods

-(IBAction)onNextButtonPressed:(id)sender
{
    ScrollViewController *mapVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ScrollViewController"];
    [self.navigationController pushViewController:mapVC animated:YES];

}
@end






