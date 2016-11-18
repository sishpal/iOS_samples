//
//  ScrollViewController.m
//  EffectiveTableSample
//
//  Created by Beryl Systems on 18/11/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma UIControll Methods

-(IBAction)onBackButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark
#pragma UICollectionView Delegates and Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomScrollViewControlllerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CustomScrollViewControlllerCell" forIndexPath:indexPath];
    [cell.m_tableView reloadData];
    return cell;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
