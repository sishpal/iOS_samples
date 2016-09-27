//
//  ViewController.m
//  ParsingJsonData
//
//  Created by Beryl Systems on 27/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.m_arrInfo = [[NSMutableArray alloc] init];


    // Do any additional setup after loading the view, typically from a nib.
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Test" ofType:@"json"];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:filePath];
    NSError *error = nil;
    self.m_jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    [self getInformation];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma Method

-(void)getInformation
{

    NSLog(@"%@",self.m_jsonDict);
    NSString *status =  [Utility  getFormattedValue:[_m_jsonDict objectForKey:@"status"]];
    NSLog(@"status %@",status);
    
    NSArray *arrData = [Utility getFormattedValue:[_m_jsonDict objectForKey:@"venues"]];
    NSLog(@"data is=> %@",arrData);
    for (NSDictionary *dicData in arrData) {
        DataHolder *objInfo = [[DataHolder alloc]initWithData:dicData];
        [self.m_arrInfo addObject:objInfo];
    }
    NSLog(@"count of array is => %ld",(long)_m_arrInfo.count);
}


#pragma mark
#pragma mark - UITableView DataSource and Delegates Methods


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.m_arrInfo.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:@"CustomViewCell"];
    DataHolder *data = (DataHolder *) [_m_arrInfo objectAtIndex:indexPath.row];
    customCell.m_lblName.text = data.m_Name;
    customCell.m_lblAddress.text = data.m_Address;
    customCell.m_lblDistance.text = data.m_Distance;
    
    return customCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailsViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
    [self.navigationController pushViewController:detailVC animated:YES];
}



@end
