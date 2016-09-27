//
//  ViewController.h
//  ParsingJsonData
//
//  Created by Beryl Systems on 27/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSDictionary *m_jsonDict;
@property (nonatomic, strong) NSMutableArray *m_arrInfo;
@end

