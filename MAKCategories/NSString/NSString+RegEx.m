//
//  NSString+RegEx.m
//  BranchChecker
//
//  Created by Martin Klöpfel on 22.12.13.
//  Copyright (c) 2013 Martin Klöpfel. All rights reserved.
//

#import "NSString+RegEx.h"

@implementation NSString (RegEx)

- (BOOL)matchRegexWithPattern:(NSString *)pattern
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [predicate evaluateWithObject:self];
}

- (NSString *)firstMatchOfPattern:(NSString *)pattern
{
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionDotMatchesLineSeparators error:&error];
    if(regex == nil)
        return nil;
    
    NSRange rangeOfFirstMatch = [regex rangeOfFirstMatchInString:self options:0 range:NSMakeRange(0, [self length])];
    if(rangeOfFirstMatch.location == NSNotFound) return nil;
    
    return [self substringWithRange:rangeOfFirstMatch];
}

@end
