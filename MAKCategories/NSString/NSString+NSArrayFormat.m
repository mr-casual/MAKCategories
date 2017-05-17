//
//  NSString+NSArrayFormat.m
//  MAKToolKit
//
//  Created by Martin Klöpfel on 04.07.13.
//  Copyright (c) 2013 Martin Klöpfel. All rights reserved.
//

#if !__has_feature(objc_arc)
#error "This file requires ARC!"
#endif


#import "NSString+NSArrayFormat.h"

@implementation NSString (NSArrayFormat)


+ (id)stringWithFormat:(NSString *)format arguments:(NSArray*)args
{
    if (!args)
        return format;
    
    NSRange range = NSMakeRange(0, [args count]);
    NSMutableData* data = [NSMutableData dataWithLength:sizeof(id) * [args count]];
    [args getObjects:(__unsafe_unretained id *)data.mutableBytes range:range];
    NSString* result = [[NSString alloc] initWithFormat:format arguments:data.mutableBytes];
    return result;
}

@end
