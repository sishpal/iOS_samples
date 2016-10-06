//
//  DetailsViewController.m
//  KobeSample
//
//  Created by Beryl Systems on 04/10/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Venue";
    // Do any additional setup after loading the view.
    NSLog(@"Selected name is => %@",self.data.m_name);
    NSLog(@"Selected latitude is => %@",self.data.m_latitude);
    NSLog(@"Selected address is => %@",self.data.m_address);
    NSLog(@"Selected description is=> %@",self.data.m_description);
    NSLog(@"Selected hours is => %@",[self.data.m_workingHours componentsJoinedByString:@"\n"]);
    NSLog(@"value of is_open is => %@",self.data.m_isOpen);
    if([self.data.m_isOpen isEqualToString:@"1"])
        self.isOpen = @"OPEN NOW";
    else
        self.isOpen = @"CLOSE NOW";
    self.m_btnRedeem.layer.cornerRadius = 50/2;
    self.m_tableView.estimatedRowHeight = 50;
    self.m_tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"Set Cell Size");
    if(indexPath.row == 0)
    {
        // NSInteger hieght = 60;
        return 60.0;
    }else if(indexPath.row == 1)
    {
        return 140.0;
    }else if(indexPath.row == 2)
    {
        return UITableViewAutomaticDimension;
    }
    else
    {
        return UITableViewAutomaticDimension;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.row == 0)
    {
        CustomDetailsViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"nameAndAddress"];
        Cell.m_lblName.text = self.data.m_name;
        Cell.m_lblAddress.text = self.data.m_address;
        Cell.m_lblDistance.text = [self.data.m_distance stringByAppendingPathComponent:@"miles"];
        Cell.m_lblIsOpen.text = _isOpen;
        Cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return Cell;
    }
    else if(indexPath.row == 1)
    {
        
        CustomDetailsViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"image"];
        Cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
         [Cell.m_imgview setImageWithURL:[NSURL URLWithString:[self.data.m_imageURL objectAtIndex:0]] placeholderImage:[UIImage imageNamed:@"pin"]];
        
        return Cell;
        
    }
    
    else if(indexPath.row == 2)
    {
        CustomDetailsViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"description"];
        Cell.m_lblDescription.text = self.data.m_description;
        Cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return Cell;
    }else
    {
        CustomDetailsViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"hours"];
        NSString *hours = [self.data.m_workingHours componentsJoinedByString:@"\n"];
        Cell.selectionStyle = UITableViewCellSelectionStyleNone;
        Cell.m_lblHours.text = hours;
        return Cell;
    }
}
- (IBAction)onBackButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onMapButtonPressed:(id)sender
{
    MapViewController *mapVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MapViewController"];
    mapVC.holder = self.data;
    
    [self.navigationController pushViewController:mapVC animated:YES];
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
