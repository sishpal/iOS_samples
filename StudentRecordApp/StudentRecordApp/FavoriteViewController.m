//
//  FavoriteViewController.m
//  StudentRecordApp
//
//  Created by Beryl Systems on 15/11/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "FavoriteViewController.h"

@interface FavoriteViewController ()

@end

@implementation FavoriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.FavoriteArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FavoriteCell *customCell = [tableView dequeueReusableCellWithIdentifier:@"FavoriteCell"];
    customCell.selectionStyle = UITableViewCellSelectionStyleNone;
    studentInfo *data = (studentInfo *) [_FavoriteArray objectAtIndex:indexPath.row];
    customCell.m_name.text = data.m_Name;
    customCell.m_name.backgroundColor = [UIColor blueColor];
    
    return customCell;

}

-(IBAction)onBackButtonPressed:(id)sender
{
    NSLog(@"Back Button Pressed");
    [self.FavoriteArray removeAllObjects];
    [self.navigationController popViewControllerAnimated:YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
