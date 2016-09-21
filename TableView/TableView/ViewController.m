//
//  ViewController.m
//  TableView
//
//  Created by Beryl Systems on 16/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "ViewController.h"
#import "CustomViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.translucent = NO;
    self.userinfoArray = [[NSMutableArray alloc]init];
    self.title = @"Add user";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark
#pragma mark - UIBarButtonItem Method

- (IBAction)onAddButtonPressed:(id)sender
{
    NSLog(@"Add (+) button is pressed");
    if(![self.m_txtfName.text isEqualToString:@""])
    {
        [self.userinfoArray addObject:[self.m_txtfName text]];
        NSLog(@"the value of array is -: %@",self.userinfoArray);
        NSLog(@"count %ld",self.userinfoArray.count);
    }
    [self.m_tblView reloadData];
    self.m_txtfName.text = nil;
}


#pragma mark
#pragma mark - UITableView DataSource and Delegates Methods


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.userinfoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:@"CustomViewCell"];
    if(indexPath.row%2 == 0)
    {
    customCell.backgroundColor = [UIColor whiteColor];
    customCell.m_lblName.textColor = [UIColor blackColor];
    }
    else
    {
        customCell.backgroundColor = [UIColor greenColor];
    }
    
    customCell.m_lblName.text = [self.userinfoArray objectAtIndex:indexPath.row];
        return customCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //CustomViewCell *cell  = (CustomViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:[self.userinfoArray objectAtIndex:indexPath.row] delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
    [alertView show];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.userinfoArray removeObjectAtIndex:indexPath.row];
//     [tableView deleteRowsAtIndexPaths:deleteIndexPaths withRowAnimation:UITableViewRowAnimationRight];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [tableView reloadData];
}



#pragma mark
#pragma mark - UITextField Delegates

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
