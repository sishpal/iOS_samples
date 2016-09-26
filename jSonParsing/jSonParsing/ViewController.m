//
//  ViewController.m
//  jSonParsing
//
//  Created by Beryl Systems on 23/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.infoArray = [[NSMutableArray alloc]init];
    self.arrTagInfo = [[NSMutableArray alloc] init];

    NSLog(@"Program run");
    [self tagList];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma Method

-(void)tagList
{
   // [self.infoArray removeAllObjects];
    NGAPIClient *client = [NGAPIClient sharedHTTPClient];
    [client getTagList : @"" completion:^(NSMutableDictionary *message, NSError *error)
     {
         if(error)
         {
             NSLog(@"Something bad happend. Please try again.");
         }
         else
         {
             NSLog(@"message is => %@",message);
             
             NSString *status = @"STATUS";
             status =  [Utility  getFormattedValue:[message objectForKey:@"status"]];
             NSLog(@"status %@",status);
             
             NSString *msg = @"MSG";
             msg = [Utility getFormattedValue:[message objectForKey:@"message"]];
             NSLog(@"status %@",msg);
            
             NSDictionary *tags = [Utility getFormattedValue:[message objectForKey:@"tags"]];
             NSLog(@"tags are => %@",tags);
             
             NSArray *arrData;
             arrData = [Utility getFormattedValue:[tags objectForKey:@"data"]];
             NSLog(@"data is=> %@",arrData);
             
             for (NSDictionary *dicData in arrData) {
                 tagInfo *objtagInfo = [[tagInfo alloc]initWithData:dicData];
                 [self.arrTagInfo addObject:objtagInfo];
             }
             
             
             NSInteger count = 0;
             count = _arrTagInfo.count;
             NSLog(@"count of array is -> %ld",(long)count);
             NSString *arrCount = [NSString stringWithFormat:@"%ld",(long)count];
             
             UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:arrCount message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"ok", nil];
             [alertView show];

             
         }
    }];
}


@end
