//
//  NSUUID+MAKHelper.m
//  MAKCategories
//
//  Created by Martin Kloepfel on 28.11.15.
//  Copyright (c) 2014 Martin Kloepfel. All rights reserved.
//

#import "NSUUID+MAKHelper.h"


@implementation NSUUID (MAKHelper)

+ (NSUUID *)UUIDWithUUIDString:(NSString *)UUIDString
{
    return [[NSUUID alloc] initWithUUIDString:UUIDString];
}

@end
