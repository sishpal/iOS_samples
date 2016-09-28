//
//  DetailsViewController.m
//  ParsingJsonData
//
//  Created by Beryl Systems on 27/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"BAR";
    NSLog(@" Selected name is => %@",self.data.m_Name);
    NSLog(@"Selected address is => %@",self.data.m_Address);
    NSLog(@"Selected description is=> %@",self.data.m_Description);
    NSLog(@"Selected hours is => %@",[self.data.m_Hours componentsJoinedByString:@" "]);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark - UITableView DataSource and Delegates Methods


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
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
        return 80.0;
    }
    else if(indexPath.row == 3)
    {
        return 144.0;
    }else
    {
        return 80.0;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.row == 0)
    {
        CustomDetailsViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"nameAndAddress"];
        Cell.m_lblName.text = self.data.m_Name;
        Cell.m_lblAddress.text = self.data.m_Address;
        Cell.m_lblDistance.text = self.data.m_Distance;
        Cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return Cell;
    }
    else if(indexPath.row == 1)
    {
        CustomDetailsViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"image"];
        Cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return Cell;
        
    }
    
    else if(indexPath.row == 2)
    {
        CustomDetailsViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"description"];
        Cell.m_lblDescription.text = self.data.m_Description;
        Cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return Cell;
    }else if(indexPath.row == 3)
    {
        CustomDetailsViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"hours"];
        NSString *hours = [self.data.m_Hours componentsJoinedByString:@"\n"];
        Cell.selectionStyle = UITableViewCellSelectionStyleNone;
        Cell.m_lblHours.text = hours;
        return Cell;
    }else
    {
        CustomDetailsViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"button"];
        Cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return Cell;
    }
}





@end
