//
//  NSString+MAKValidation.m
//  MAKCategories
//
//  Created by Martin Kloepfel on 28.11.15.
//  Copyright (c) 2014 Martin Kloepfel. All rights reserved.
//

#import "NSString+MAKValidation.h"


@implementation NSString (MAKValidation)

- (BOOL)isNotEmpty
{
    if (![self isKindOfClass:[NSString class]] || self.length == 0)
        return NO;
    return YES;
}

@end
