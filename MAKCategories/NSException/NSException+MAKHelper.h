//
//  NSException+MAKHelper.h
//  MAKCategories
//
//  Created by Martin Kloepfel on 28.11.15.
//  Copyright (c) 2014 Martin Kloepfel. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MAKDefines.h"

#ifndef NSException_MAKHelper_h
#define NSException_MAKHelper_h

#define MAKRaiseInvalidArgumentException(argument) \
    [NSException raiseInvalidArgumentException:[NSString stringWithFormat:@"%s=%@", #argument, argument] \
                             methodDescription:[NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__]]

#define MAKRaiseInternalInconsistencyException(format, ...) \
    [NSException raiseInternalInconsistencyExceptionInClassWithName:__PRETTY_CLASS__ \
                                                     description:[NSString stringWithFormat:format, ## __VA_ARGS__]]
#endif


@interface NSException (MAKHelper)

+ (void)raiseInvalidArgumentException:(NSString *)argumentDescription methodDescription:(NSString *)methodDescription;

+ (void)raiseInvalidArgumentExceptionWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);

+ (void)raiseInternalInconsistencyExceptionInClassWithName:(NSString *)className description:(NSString *)exceptionDescription;

+ (void)raiseInternalInconsistencyExceptionWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);

@end
