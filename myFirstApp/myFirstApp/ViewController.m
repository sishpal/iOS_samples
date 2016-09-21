//
//  ViewController.m
//  myFirstApp
//
//  Created by Beryl Systems on 13/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //enter the value in array and print its value

    NSMutableArray *array = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6", nil];
    NSLog(@"%lu",(unsigned long)array.count);
    
    NSInteger myArray[10];
    for (NSInteger k = 0;k < 10; k++)
        myArray[k] = k;
    for(NSInteger k = 0; k < 10; k++)
    NSLog(@"%ld \n",(long)myArray[k]);
    
    
    //another example
    double balance[5] = {1000.0, 2.0, 3.4, 17.0, 50.0};
    
    NSLog(@"The values of next array := \n\n");
    for(NSInteger m = 0; m <= 4; m++)
    {
        NSLog(@"%ld \n",(long)balance[m]);
    
    }
    
    // calculate the factorial of entered number
    
    NSInteger i;
    NSInteger fact = 1;
    for(i = 1; i <= 5; i++){
        fact = fact * i;
    }
    NSLog(@" factorial of entered number is := %ld\n",(long)fact);
    
    //to check the nuber is palindrom or not
    
    NSInteger num, temp, rem, rev = 0;
    num = 121;
    temp = num;
    while (num != 0) {
        rem = num % 10;
        num = num / 10;
        rev = rev * 10 + rem;
    }
    if(rev == temp)
        NSLog(@"\n The number is palindrom\n");
    else
        NSLog(@"\n Thenumber is not palindrom\n");
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)firstMethods
{
    self.arraySample = [[NSMutableArray alloc]init];
}
@end
