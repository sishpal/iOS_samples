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
bool sectionopen[4]; ///or some other way of storing the sections expanded/closed state
 NSMutableIndexSet *expandedSections;


- (void)viewDidLoad {
    [super viewDidLoad];
    expandedSections = [[NSMutableIndexSet alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)tableView:(UITableView *)tableView canCollapseSection:(NSInteger)section
{
    if (section>0) return YES;
    
    return NO;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self tableView:tableView canCollapseSection:section])
    {
        if ([expandedSections containsIndex:section])
        {
            return 5; // return rows when expanded
        }
        
        return 1; // only top row showing
    }
    
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
//    NSString *rowNumber = [@(indexPath.row) stringValue];
//    if(indexPath.row == 0)
//    {
//    self.name = @"Section";
//    }
//    else
//        _name = @"Row";
//    customCell.m_sectionName.text = [_name stringByAppendingPathComponent:rowNumber];
//    customCell.m_sectionName.text = @"section";
    if ([self tableView:tableView canCollapseSection:indexPath.section])
    {
        if (!indexPath.row)
        {
            // first row
            customCell.textLabel.text = @"Expandable"; // only top row showing
            
            if ([expandedSections containsIndex:indexPath.section])
            {
                //                cell.accessoryView = [DTCustomColoredAccessory accessoryWithColor:[UIColor grayColor] type:DTCustomColoredAccessoryTypeUp];
            }
            else
            {
                //                cell.accessoryView = [DTCustomColoredAccessory accessoryWithColor:[UIColor grayColor] type:DTCustomColoredAccessoryTypeDown];
            }
        }
        else
        {
            // all other rows
            customCell.textLabel.text = @"Some Detail";
            customCell.accessoryView = nil;
            customCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    else
    {
        customCell.accessoryView = nil;
        customCell.textLabel.text = @"Normal Cell";
        
    }

    return customCell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([self tableView:tableView canCollapseSection:indexPath.section])
    {
        if (!indexPath.row)
        {
            [self.m_tableView beginUpdates];
            
            // only first row toggles exapand/collapse
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            
            NSInteger section = indexPath.section;
            BOOL currentlyExpanded = [expandedSections containsIndex:section];
            NSInteger rows;
            
            NSMutableArray *tmpArray = [NSMutableArray array];
            
            if (currentlyExpanded)
            {
                rows = [self tableView:tableView numberOfRowsInSection:section];
                [expandedSections removeIndex:section];
                
            }
            else
            {
                [expandedSections addIndex:section];
                rows = [self tableView:tableView numberOfRowsInSection:section];
            }
            
            for (int i=1; i<rows; i++)
            {
                NSIndexPath *tmpIndexPath = [NSIndexPath indexPathForRow:i inSection:section];
                [tmpArray addObject:tmpIndexPath];
            }
            
            TableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
            
            if (currentlyExpanded)
            {
                [tableView deleteRowsAtIndexPaths:tmpArray
                                 withRowAnimation:UITableViewRowAnimationTop];
                customCell.textLabel.text = @"1";
                //                cell.accessoryView = [DTCustomColoredAccessory accessoryWithColor:[UIColor grayColor] type:DTCustomColoredAccessoryTypeDown];
                
            }
            else
            {
                [tableView insertRowsAtIndexPaths:tmpArray
                                 withRowAnimation:UITableViewRowAnimationTop];
                customCell.textLabel.text = @"2";
                //                cell.accessoryView =  [DTCustomColoredAccessory accessoryWithColor:[UIColor grayColor] type:DTCustomColoredAccessoryTypeUp];
                
            }
            
            [self.m_tableView endUpdates];
        }
    }
    
    
    
//    if(indexPath.section == 0)
//    {
//        NSLog(@"select first section");
//        if(indexPath.row == 0)
//        {
//            NSLog(@"select first row");
//        }
//        if(indexPath.row == 1)
//        {
//            NSLog(@"select second row");
//        }
//    }
//    if(indexPath.section == 1)
//    {
//        NSLog(@"Select second Section");
//        if(indexPath.row == 0)
//        {
//            NSLog(@"select first row");
//        }
//        if(indexPath.row == 1)
//        {
//            NSLog(@"select second row");
//        }
//        if(indexPath.row == 2)
//        {
//            NSLog(@"select thirdrow");
//        }
//    }
//    if(indexPath.section == 2)
//    {
//        NSLog(@"Select third Section");
//        if(indexPath.row == 0)
//        {
//            NSLog(@"select first row");
//        }
//        if(indexPath.row == 1)
//        {
//            NSLog(@"select second row");
//        }
//    }
//    [self.m_tableView reloadData];
    
}






@end
