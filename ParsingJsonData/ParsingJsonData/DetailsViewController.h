//
//  DetailsViewController.h
//  ParsingJsonData
//
//  Created by Beryl Systems on 27/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "ViewController.h"

@interface DetailsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) DataHolder *data;




@end
