//
//  Utility.m
//  jSonParsing
//
//  Created by Beryl Systems on 26/09/16.
//  Copyright © 2016 Beryl Systems. All rights reserved.
//

#import "Utility.h"

@implementation Utility

static char base64EncodingTable[64] = {
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
    'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
    'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
    'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/'
};

+ (void)showAlertWithTitle:(NSString *)title withMessage:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}
+ (id)getFormattedValue:(id)value
{
    if(value)
    {
        if([value isKindOfClass:[NSNull class]])
        {
            return [NSString string];
        }
        else if([value isKindOfClass:[NSNumber class]])
        {
            return [(NSNumber *)value stringValue];
        }
        else if([value isKindOfClass:[NSString class]])
        {
            if(([value caseInsensitiveCompare:@"null"] == NSOrderedSame) || ([value caseInsensitiveCompare:@"(null)"] == NSOrderedSame))
            {
                return [NSString string];
            }
            else
            {
                return value;
            }
        }
        else
        {
            return value;
        }
    }
    return [NSString string];
}

+ (NSString *)iPhoneModel
{
    NSString *iPhoneModel = @"";
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 568)
        {
            // iPhone Classic
            iPhoneModel = @"iphone5s";
        }
        else if(result.height == 667)
        {
            // iPhone 5
            iPhoneModel = @"iphone6";
        }
        else if (result.height == 480)
        {
            iPhoneModel = @"iphone4s";
        }
        else
        {
            iPhoneModel = @"iphone6+";
        }
    }
    return iPhoneModel;
}

+ (NSString *) base64StringFromData: (NSData *)data length: (int)length {
    unsigned long ixtext, lentext;
    long ctremaining;
    unsigned char input[3], output[4];
    short i, charsonline = 0, ctcopy;
    const unsigned char *raw;
    NSMutableString *result;
    
    lentext = [data length];
    if (lentext < 1)
        return @"";
    result = [NSMutableString stringWithCapacity: lentext];
    raw = [data bytes];
    ixtext = 0;
    
    while (true) {
        ctremaining = lentext - ixtext;
        if (ctremaining <= 0)
            break;
        for (i = 0; i < 3; i++) {
            unsigned long ix = ixtext + i;
            if (ix < lentext)
                input[i] = raw[ix];
            else
                input[i] = 0;
        }
        output[0] = (input[0] & 0xFC) >> 2;
        output[1] = ((input[0] & 0x03) << 4) | ((input[1] & 0xF0) >> 4);
        output[2] = ((input[1] & 0x0F) << 2) | ((input[2] & 0xC0) >> 6);
        output[3] = input[2] & 0x3F;
        ctcopy = 4;
        switch (ctremaining) {
            case 1:
                ctcopy = 2;
                break;
            case 2:
                ctcopy = 3;
                break;
        }
        
        for (i = 0; i < ctcopy; i++)
            [result appendString: [NSString stringWithFormat: @"%c", base64EncodingTable[output[i]]]];
        
        for (i = ctcopy; i < 4; i++)
            [result appendString: @"="];
        
        ixtext += 3;
        charsonline += 4;
        
        if ((length > 0) && (charsonline >= length))
            charsonline = 0;
    }
    return result;
}




@end
