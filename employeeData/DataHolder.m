//
//  DataHolder.m
//  employeeData
//
//  Created by Beryl Systems on 20/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "DataHolder.h"

@implementation DataHolder

- (id)init
{
    if(self == [super init])
    {
        self.empId = @"";
        self.empName = @"";
        self.empAddress = @"";
    }
    return self;
}

@end
