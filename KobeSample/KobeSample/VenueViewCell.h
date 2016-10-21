//
//  VenueViewCell.h
//  KobeSample
//
//  Created by Beryl Systems on 21/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VenueViewCell : UICollectionViewCell
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) IBOutlet UIImageView *m_barImage;
@property (nonatomic, strong) IBOutlet UILabel *m_lblTitle;
@property (nonatomic, strong) IBOutlet UILabel *m_lblSubTitle;
@property (nonatomic, strong) IBOutlet UIImageView *m_imgIcon;



@end
