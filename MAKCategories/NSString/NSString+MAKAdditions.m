//
//  NSString+MAKAdditions.m
//  BranchChecker
//
//  Created by Martin Klöpfel on 22.12.13.
//  Copyright (c) 2013 Martin Klöpfel. All rights reserved.
//

#import "NSString+MAKAdditions.h"

@implementation NSString (MAKAdditions)

- (NSString*)substringBetweenString:(NSString*)start andString:(NSString*)end
{
    NSRange startRange = [self rangeOfString:start];
    if (startRange.location != NSNotFound) {
        NSRange targetRange;
        targetRange.location = startRange.location + startRange.length;
        targetRange.length = [self length] - targetRange.location;
        NSRange endRange = [self rangeOfString:end options:0 range:targetRange];
        if (endRange.location != NSNotFound) {
            targetRange.length = endRange.location - targetRange.location;
            return [self substringWithRange:targetRange];
        }
    }
    return nil;
}

@end
