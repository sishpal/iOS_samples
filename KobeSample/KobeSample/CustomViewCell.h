//
//  CustomViewCell.h
//  KobeSample
//
//  Created by Beryl Systems on 04/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomViewCell : UITableViewCell 
@property (nonatomic, strong) IBOutlet UIImageView *m_imgview;
@property (nonatomic, strong) IBOutlet UILabel *m_lblAddress;
@property (nonatomic, strong) IBOutlet UILabel *m_lblDistance;
@property (nonatomic, strong) IBOutlet UILabel *m_lblName;

@end
