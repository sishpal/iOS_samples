//
//  SearchViewController.m
//  KobeSample
//
//  Created by Beryl Systems on 05/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark
#pragma UICollectionView Delegates and DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    if(indexPath.row%2 == 0)
        cell.backgroundColor = [UIColor redColor];
    else
        cell.backgroundColor = [UIColor blueColor];
    cell.m_lblTagName.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    return cell;
}


- (IBAction)onBackButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    NSLog(@"retun called");
    return YES;
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
