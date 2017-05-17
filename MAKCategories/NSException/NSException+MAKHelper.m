//
//  NSException+MAKHelper.m
//  MAKCategories
//
//  Created by Martin Kloepfel on 28.11.15.
//  Copyright (c) 2014 Martin Kloepfel. All rights reserved.
//

#import "NSException+MAKHelper.h"

#import "NSString+MAKValidation.h"


@implementation NSException (MAKHelper)

+ (void)raiseInvalidArgumentException:(NSString *)argumentDescription methodDescription:(NSString *)methodDescription
{
    if (!argumentDescription.isNotEmpty || !methodDescription.isNotEmpty)
    {
        [self raiseInvalidArgumentExceptionWithFormat:nil];
        return;
    }
    
    if (!methodDescription.isNotEmpty)
    {
        [self raiseInvalidArgumentExceptionWithFormat:@"invalid parameter: %@.", argumentDescription];
        return;
    }
    
    [self raiseInvalidArgumentExceptionWithFormat:@"%@ invalid parameter: %@.", methodDescription, argumentDescription];
}

+ (void)raiseInvalidArgumentExceptionWithFormat:(NSString *)format, ...
{
    va_list ap;
    va_start(ap, format);
    
    [self raise:NSInvalidArgumentException format:format arguments:ap];
    
    va_end(ap);
}

+ (void)raiseInternalInconsistencyExceptionInClassWithName:(NSString *)className description:(NSString *)exceptionDescription
{
    if (!className.isNotEmpty)
    {
        [self raiseInternalInconsistencyExceptionWithFormat:exceptionDescription];
        return;
    }
    
    [self raiseInternalInconsistencyExceptionWithFormat:[NSString stringWithFormat:@"%@ %@", className, exceptionDescription]];
}

+ (void)raiseInternalInconsistencyExceptionWithFormat:(NSString *)format, ...
{
    va_list ap;
    va_start(ap, format);
    
    [self raise:NSInternalInconsistencyException format:format arguments:ap];
    
    va_end(ap);
}

@end
