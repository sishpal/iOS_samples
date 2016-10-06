//
//  MenuViewCell.h
//  Gase
//
//  Created by Prashant Aggarwal on 4/14/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *m_lblTitle;
@property (nonatomic, strong) IBOutlet UIImageView *m_menuImage;
@property (nonatomic, strong) IBOutlet UIView *vwSeperator;

@end
