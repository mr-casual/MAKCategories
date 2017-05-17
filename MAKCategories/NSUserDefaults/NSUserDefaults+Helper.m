//
//  NSUserDefaults+Helper.m
//  MAKToolKit
//
//  Created by Martin Klöpfel on 28.02.14.
//  Copyright (c) 2014 Martin Klöpfel. All rights reserved.
//

#if !__has_feature(objc_arc)
#error "This file requires ARC!"
#endif

#import "NSUserDefaults+Helper.h"

@implementation NSUserDefaults (Helper)

#pragma mark - 

- (void)synchronizeWithCompletion:(void (^)(BOOL success))completion
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
    dispatch_async(queue, ^(void) {
        __block BOOL synchronized = [self synchronize];
        if(completion)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(synchronized);
            });
        }
    });
}

- (void)clearWithCompletion:(void (^)(BOOL success))completion
{
    for (NSString* key in [self dictionaryRepresentation].allKeys)
    {
        if ([self objectForKey:key])
            [self removeObjectForKey:key];
    }
    
    [self synchronizeWithCompletion:completion];
}


#pragma mark -

- (id)objectForKey:(NSString *)key tryUnarchiveObject:(BOOL)tryUnarchiveObject
{
    id obj = [self objectForKey:key];
    
    if (tryUnarchiveObject && [obj isKindOfClass:[NSData class]])
    {
        @try {
            obj = [NSKeyedUnarchiver unarchiveObjectWithData:obj];
        }
        @catch (NSException *exception) {
            // do nothing... continue to return object
        }
    }
    
    return obj;
}

- (NSArray *)arrayForKey:(NSString *)key tryUnarchiveObjects:(BOOL)tryUnarchiveObjects
{
    NSArray *array = [self arrayForKey:key];
    NSMutableArray *mutableArray = [NSMutableArray new];
    
    if (tryUnarchiveObjects) {
        for (id object in array) {
            if ([object isKindOfClass:[NSData class]]) {
                @try {
                    id mutableObject;
                    mutableObject = [NSKeyedUnarchiver unarchiveObjectWithData:object];
                    [mutableArray addObject:mutableObject];
                }
                @catch (NSException *exception) {
                    // do nothing... continue to return object
                }
            }
        }
        array = [NSArray arrayWithArray:mutableArray];
    }
    return array;
}

#pragma mark - 

- (BOOL)saveFloatValue:(float)value forKey:(NSString*)key
{
    [self setFloat:value forKey:key];
    return [self synchronize];
}

- (void)saveFloatValue:(float)value forKey:(NSString*)key completion:(void (^)(BOOL success))completion
{
    [self setFloat:value forKey:key];
    [self synchronizeWithCompletion:completion];
}

- (BOOL)saveDoubleValue:(double)value forKey:(NSString*)key
{
    [self setDouble:value forKey:key];
    return [self synchronize];
}


- (void)saveDoubleValue:(double)value forKey:(NSString*)key completion:(void (^)(BOOL success))completion
{
    [self setDouble:value forKey:key];
    [self synchronizeWithCompletion:completion];
}

- (BOOL)saveIntegerValue:(NSInteger)value forKey:(NSString*)key
{
    [self setInteger:value forKey:key];
    return [self synchronize];
}

- (void)saveIntegerValue:(NSInteger)value forKey:(NSString*)key completion:(void (^)(BOOL success))completion
{
    [self setInteger:value forKey:key];
    [self synchronizeWithCompletion:completion];
}

- (BOOL)saveBoolValue:(BOOL)value forKey:(NSString*)key
{
    [self setBool:value forKey:key];
    return [self synchronize];
}

- (void)saveBoolValue:(BOOL)value forKey:(NSString*)key completion:(void (^)(BOOL success))completion
{
    [self setBool:value forKey:key];
    [self synchronizeWithCompletion:completion];
}

- (BOOL)saveArray:(NSArray *)array forKey:(NSString*)key tryArchiveObjects:(BOOL)tryArchiveObjects
{
    if (tryArchiveObjects)
    {
        NSMutableArray *mutableArray = [NSMutableArray new];
        for (id object in array) {
            if ([object conformsToProtocol:@protocol(NSCoding)])
            {
                @try {
                    id objectData;
                    objectData = [NSKeyedArchiver archivedDataWithRootObject:object];
                    [mutableArray addObject:objectData];
                }
                @catch (NSException *exception) {
                    return NO;
                }
            }
            else
            {
                NSLog(@"Error - [NSUserDefaults saveObject:forKey:]: attempt to insert non-property list object %@ for key %@", object, key);
                return NO;
            }
        }
        array = [NSArray arrayWithArray:mutableArray];
    }
    [self setObject:array forKey:key];
    return [self synchronize];
}

- (BOOL)saveObject:(id)object forKey:(NSString*)key tryArchiveObject:(BOOL)tryArchiveObject
{
    if (![object isKindOfClass:[NSNumber class]]        ||
        ![object isKindOfClass:[NSString class]]        ||
        ![object isKindOfClass:[NSArray class]]         ||
        ![object isKindOfClass:[NSDictionary class]]    ||
        ![object isKindOfClass:[NSData class]]          ||
        ![object isKindOfClass:[NSDate class]])
    {
        if (tryArchiveObject)
        {
            if ([object conformsToProtocol:@protocol(NSCoding)])
            {
                @try {
                    object = [NSKeyedArchiver archivedDataWithRootObject:object];
                }
                @catch (NSException *exception) {
                    return NO;
                }
            }
            else
            {
                NSLog(@"Error - [NSUserDefaults saveObject:forKey:]: attempt to insert non-property list object %@ for key %@", object, key);
                return NO;
            }
        }
    }
    
    [self setObject:object forKey:key];
    return [self synchronize];
}

- (void)saveObject:(id)object forKey:(NSString*)key tryArchiveObject:(BOOL)tryArchiveObject completion:(void (^)(BOOL success))completion
{
    if (object &&
        (![object isKindOfClass:[NSNumber class]]       ||
        ![object isKindOfClass:[NSString class]]        ||
        ![object isKindOfClass:[NSArray class]]         ||
        ![object isKindOfClass:[NSDictionary class]]    ||
        ![object isKindOfClass:[NSData class]]          ||
        ![object isKindOfClass:[NSDate class]]))
    {
        if (tryArchiveObject)
        {
            if ([object conformsToProtocol:@protocol(NSCoding)])
            {
                @try {
                    object = [NSKeyedArchiver archivedDataWithRootObject:object];
                }
                @catch (NSException *exception) {
                    if (completion)
                        completion(NO);
                    return;
                }
            }
            else
            {
                [NSException raise:NSInvalidArgumentException format:@"[NSUserDefaults saveAsyncObject:forKey:]: attempt to insert non-property list object %@ for key %@", object, key];
                if (completion)
                    completion(NO);
                return;
            }
        }
    }
    
    [self setObject:object forKey:key];
    [self synchronizeWithCompletion:completion];
}


#pragma mark -

- (void)removeObjectForKey:(NSString*)key completion:(void (^)(BOOL success))completion
{
    if (![self objectForKey:key])
    {
        if (completion)
            completion(YES);
        return;
    }
    
    [self removeObjectForKey:key];
    [self synchronizeWithCompletion:completion];
}


#pragma mark -

- (void)registerTimeStampForKey:(NSString*)key
{
    if (!key)
        return;
    
    [self saveDoubleValue:[[NSDate date] timeIntervalSince1970] forKey:key completion:nil];
}

- (void)registerPerformCountForKey:(NSString*)key
{
    if (!key)
        return;
    
    NSUInteger count = [self integerForKey:key];
    [self saveIntegerValue:++count forKey:key completion:nil];
}

- (void)registerTimeStampForKey:(NSString*)timeStampKey
          andPerformCountForKey:(NSString*)performCountKey
{
    [self registerTimeStampForKey:timeStampKey];
    [self registerPerformCountForKey:performCountKey];
}

- (void)resetTimeStampForKey:(NSString*)key
{
    if (!key)
        return;
    [self removeObjectForKey:key completion:nil];
}

- (void)resetPerformCountForKey:(NSString*)key
{
    if (!key)
        return;
    [self removeObjectForKey:key completion:nil];
}

- (void)resetTimeStampForKey:(NSString*)timeStampKey
    andPerformCountForKey:(NSString*)performCountKey
{
    [self removeObjectForKey:timeStampKey completion:nil];
    [self removeObjectForKey:performCountKey completion:nil];
}

- (BOOL)shouldPerformPeriodicFeatureWithTimeStampKey:(NSString*)timeStampKey
                                  andPerformInterval:(NSTimeInterval)performInterval
{
    if (timeStampKey)
    {
        NSTimeInterval timestamp = [self doubleForKey:timeStampKey];
        if (timestamp == 0.0)
            return YES;
        
        NSDate* lastPerformDate = [NSDate dateWithTimeIntervalSince1970:timestamp];
        if ([[NSDate date] timeIntervalSinceDate:lastPerformDate] < performInterval)
            return NO;
    }
	return YES;
}

- (BOOL)shouldPerformFeatureWithPerformCountKey:(NSString*)performCountKey
                             andMaxPerformCount:(NSUInteger)maxPerformCount
{
    if (performCountKey)
    {
        NSUInteger performCount = [self integerForKey:performCountKey];
        if (maxPerformCount != 0 && performCount >= maxPerformCount)
            return NO;
    }
    return YES;
}

- (BOOL)shouldPerformPeriodicFeatureWithTimeStampKey:(NSString*)timeStampKey
                                     performInterval:(NSTimeInterval)performInterval
                                     performCountKey:(NSString*)performCountKey
                                  andMaxPerformCount:(NSUInteger)maxPerformCount
{
    return ([self shouldPerformFeatureWithPerformCountKey:performCountKey andMaxPerformCount:maxPerformCount] &&
            [self shouldPerformPeriodicFeatureWithTimeStampKey:timeStampKey andPerformInterval:performInterval]);
}

@end
