//
//  NSString+Encoding.m
//  MAKToolKit
//
//  Created by Martin Klöpfel on 03.12.13.
//  Copyright (c) 2013 Martin Klöpfel. All rights reserved.
//

#import "NSString+Encoding.h"

@implementation NSString (Encoding)

- (NSString *)stringByURLEncoding
{
    return (NSString *) CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                                  (CFStringRef)self,
                                                                                  NULL,
                                                                                  CFSTR("/%&=?$#+@<>|\\,'[]{}^:;"),
                                                                                  kCFStringEncodingUTF8));
}


@end
