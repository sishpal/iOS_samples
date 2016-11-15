//
//  studentInfo.m
//  StudentRecordApp
//
//  Created by Beryl Systems on 11/11/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "studentInfo.h"

@implementation studentInfo

- (id)init
{
    if(self == [super init])
    {
        self.m_Name = @"";
        self.m_RollNo = @"";
        self.m_Class = @"";
        self.m_Section = @"";
    }
    return self;
}
@end
