//
//  ViewController.m
//  UIDatPicker
//
//  Created by Beryl Systems on 21/09/16.
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
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectDate:(id)sender
{
    NSLog(@"Pressed selectedDate");
    NSDate *date = [self.m_datePicker date];
    NSLog(@"date is -> %@",date);
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    //NSData *today = @"2016-09-21";
    //[self.m_datePicker setMaximumDate:today];
    
    NSString *outputString = [formatter stringFromDate:date];
    NSLog(@"new formate of date is => %@",outputString);
    self.m_lblDate.text = [NSString stringWithFormat:@"%@",outputString];


    
    
    
    


}


@end
