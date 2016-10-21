//
//  HowItWorksViewController.h
//  KobeSample
//
//  Created by Beryl Systems on 21/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HowItWorksViewController : UIViewController <UICollectionViewDataSource,
UICollectionViewDelegate>
@property (nonatomic, strong) IBOutlet UIPageControl *m_pageControl;
@property (nonatomic, strong) IBOutlet UICollectionView *m_collectionView;

@end
