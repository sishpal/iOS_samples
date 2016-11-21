//
//  ViewController.m
//  EffectiveTableSample
//
//  Created by Beryl Systems on 18/11/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.blurView.blurRadius = 0;
    self.navigationController.navigationBar.translucent = NO;


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark
#pragma UITableView Delegates and Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //    NSLog(@"Set Cell Size");
    if(indexPath.row == 0) {
        return 504;
    }
    else 
        return 100;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.row == 0)
    {
        ViewControllerCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"Time"];
        Cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return Cell;
    }
    else{
        ViewControllerCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"Image"];
        Cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
        return Cell;
    }
}


#pragma mark
#pragma UIScrollView Delegates


- (void)scrollViewDidScroll:(UIScrollView *)scrollView;                                               // any offset changes

{
    NSInteger n = self.m_tableView.contentOffset.y;
    NSInteger k = 1;
    NSLog(@"value of y is -> %ld",(long)self.m_tableView.contentOffset.y);
    NSLog(@"blurview radius is -> %ld",(long)self.blurView.blurRadius);

    if(n <= 0)
    {
        [UIView animateWithDuration:0 animations:^{
                        self.blurView.blurRadius = 0;
                    }];
    }
    else
    {
        for(NSInteger i = 1; i <= n; i++)
        {
            if(i>=20)
            {
                n = n-22;
                i = 1;
                k = k + 1;
            }
        }
        [UIView animateWithDuration:0 animations:^{
            self.blurView.blurRadius = k;
        }];

    }
    
    
}

#pragma mark
#pragma UIControll Methods

-(IBAction)onNextButtonPressed:(id)sender
{
    ScrollViewController *mapVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ScrollViewController"];
    [self.navigationController pushViewController:mapVC animated:YES];

}
@end






