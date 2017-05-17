//
//  NSObject+MAKObjectCaching.m
//  MAKToolKit
//
//  Created by Martin Kloepfel on 15.06.15.
//  Copyright (c) 2015 Martin Kloepfel. All rights reserved.
//

#import "NSObject+MAKObjectCaching.h"

#import <objc/runtime.h>


@implementation NSObject (MAKObjectCaching)

- (void)setCachingObject:(id)object forKey:(id <NSCopying>)key
{
    if (!key) //TODO: maybe throw exeption?
        return;
    
    if (!object)
    {
        [self removeCachingObjectForKey:key];
        return;
    }
    
    [self.mak_ObjectCachingDictionary setObject:object forKey:key];
}

- (id)cachingObjectForKey:(id)key
{
    if (!key) //TODO: maybe throw exeption?
        return nil;
    return self.mak_ObjectCachingDictionary[key];
}

- (void)removeCachingObjectForKey:(id)key
{
    if (!key) //TODO: maybe throw exeption?
        return;
    [self.mak_ObjectCachingDictionary removeObjectForKey:key];
}

- (NSMutableDictionary *)mak_ObjectCachingDictionary
{
    NSMutableDictionary *dictionary = objc_getAssociatedObject(self, @selector(mak_ObjectCachingDictionary));
    
    if (!dictionary)
    {
        dictionary = [NSMutableDictionary new];
        objc_setAssociatedObject(self, @selector(mak_ObjectCachingDictionary), dictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return dictionary;
}

@end
