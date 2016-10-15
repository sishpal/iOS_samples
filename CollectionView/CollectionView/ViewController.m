//
//  ViewController.m
//  CollectionView
//
//  Created by Beryl Systems on 30/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
    cell.m_lblCellNumber.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected index is => %ld",(long)indexPath.row+1);
//    NSString *str = [NSString stringWithFormat:"%@",indexPath.row];
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:[NSString stringWithFormat:@"Cell : %ld selected", indexPath.row + 1] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"ok", nil];
    [alertView show];
}

@end
