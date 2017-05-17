//
//  NSDateFormatter+ISO8601.m
//  MAKToolKit
//
//  Created by Martin Kloepfel on 02.04.15.
//  Copyright (c) 2014 Martin Kloepfel. All rights reserved.
//

#import "NSDateFormatter+ISO8601.h"

@implementation NSDateFormatter (ISO8601)

+ (NSDateFormatter *)dateFormatterForISO8601
{
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter)
    {
        dateFormatter = [NSDateFormatter new];
        [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"]];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
    }
    return dateFormatter;
}

@end
