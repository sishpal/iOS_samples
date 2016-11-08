//
//  ViewController.m
//  AccordianSample
//
//  Created by Beryl Systems on 07/11/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
        return 1;
    else if(section == 1)
        return 2;
    else
        return 3;
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapGesture:)];
    [tapGesture1 setDelegate: self];
    UIView* m_viewSection = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,504)];
    [m_viewSection setBackgroundColor:[UIColor lightGrayColor]];
    UILabel *m_label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 320, 44)];
    m_label.text = @"Section";
    [m_label setFont:[UIFont boldSystemFontOfSize:15]];
    [m_viewSection addSubview:m_label];
    [m_viewSection self];
    [m_viewSection addGestureRecognizer:tapGesture1];
    return m_viewSection;
}


- (void) tapGesture: (id)sender
{
    NSLog(@"TapGesture is clicked");
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    customCell.selectionStyle = UITableViewCellSelectionStyleNone;
        customCell.m_sectionName.text = @"Row";
        return customCell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section {
    return [self tableView:tableView heightForHeaderInSection:section];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"Row Selected %ld",(long)indexPath.row+1);
    TableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    customCell.m_sectionName.text = @"0";
}


- (void)tableView:(FZAccordionTableView *)tableView willOpenSection:(NSInteger)section withHeader:(UITableViewHeaderFooterView *)header {
    
}

- (void)tableView:(FZAccordionTableView *)tableView didOpenSection:(NSInteger)section withHeader:(UITableViewHeaderFooterView *)header {
    
}

- (void)tableView:(FZAccordionTableView *)tableView willCloseSection:(NSInteger)section withHeader:(UITableViewHeaderFooterView *)header {
    
}

- (void)tableView:(FZAccordionTableView *)tableView didCloseSection:(NSInteger)section withHeader:(UITableViewHeaderFooterView *)header {
    
}




@end
