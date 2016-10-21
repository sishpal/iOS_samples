//
//  HowItWorksViewController.m
//  KobeSample
//
//  Created by Beryl Systems on 21/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "HowItWorksViewController.h"

@interface HowItWorksViewController ()

@end

@implementation HowItWorksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"How It Works";
    [self.navigationController.navigationBar setHidden:YES];
    [[UIApplication sharedApplication] setStatusBarHidden:YES
                                            withAnimation:UIStatusBarAnimationSlide];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark
#pragma mark - UIControl Methods


- (IBAction)onCloseButtonPressed:(id)sender
{
    [self.navigationController.navigationBar setHidden:NO];
    [[UIApplication sharedApplication] setStatusBarHidden:NO
                                            withAnimation:UIStatusBarAnimationSlide];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIScrollVewDelegate for UIPageControl

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.m_collectionView.frame.size.width;
    float currentPage = self.m_collectionView.contentOffset.x / pageWidth;
    NSLog(@"%f",fmodf(currentPage, 1.0f));
    
    if (0.0f != fmodf(currentPage, 1.0f)) {
        self.m_pageControl.currentPage = currentPage + 1;
    } else {
        self.m_pageControl.currentPage = currentPage;
    }
    
    self.m_pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    
    NSLog(@"finishPage: %ld", (long)self.m_pageControl.currentPage);
    
}

#pragma mark
#pragma mark - UICollectionView Datasource and Delegates Methods

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    VenueViewCell* cell = (VenueViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"VenueViewCell" forIndexPath:indexPath];
    if(indexPath.row == 0)
    {
        cell.m_lblTitle.text = @"Register";
        cell.m_lblSubTitle.text = @"Just $9.95/month";
        cell.m_imgIcon.image = [UIImage imageNamed:@"pin"];
    }
    else if(indexPath.row == 1)
    {
        cell.m_lblTitle.text = @"Redeem";
        cell.m_lblSubTitle.text = @"A free drink\neveryday";
        cell.m_imgIcon.image = [UIImage imageNamed:@"glass"];
        
    }
    else if(indexPath.row == 2)
    {
        cell.m_lblTitle.text = @"Repeat";
        cell.m_lblSubTitle.text = @"Try a new venue\ntomorrow";
        cell.m_imgIcon.image = [UIImage imageNamed:@"clock"];
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    float cellWidth = screenWidth; //Replace the divisor with the column count requirement. Make sure to have it in float.
    CGSize size = CGSizeMake(screenRect.size.width,screenRect.size.height);
    
    return size;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
}



@end
