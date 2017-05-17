//
//  NSString+Version.m
//  MAKToolKit
//
//  Created by Martin Klöpfel on 04.06.14.
//  Copyright (c) 2014 Martin Klöpfel. All rights reserved.
//

#import "NSString+Version.h"

@implementation NSString (Version)

- (NSComparisonResult)compareWithVersion:(NSString*)version
{
    return [self compare:version options:NSNumericSearch];
}

+ (NSComparisonResult)compareVersion:(NSString*)versionA withVersion:(NSString*)versionB
{
    return [versionA compareWithVersion:versionB];
}

@end
