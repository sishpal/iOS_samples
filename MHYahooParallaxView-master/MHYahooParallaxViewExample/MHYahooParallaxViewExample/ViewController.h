//
//  ViewController.h
//  CollectViewTest
//
//  Created by Michael Henry Pantaleon on 2/08/2014.
//  Copyright (c) 2014 Michael Henry Pantaleon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTableViewCell.h"
@interface ViewController : UIViewController{
    CGFloat _imageHeaderHeight;
}

@property (nonatomic, weak) FXBlurView  *blurView;

@end
