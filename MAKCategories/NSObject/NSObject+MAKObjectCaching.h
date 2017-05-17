//
//  NSObject+MAKObjectCaching.h
//  MAKToolKit
//
//  Created by Martin Kloepfel on 15.06.15.
//  Copyright (c) 2015 Martin Kloepfel. All rights reserved.
//

#import <Foundation/Foundation.h>


/** This category is used for caching an object on an other object. //TODO: write better comment^^
 */
@interface NSObject (MAKObjectCaching)

- (void)setCachingObject:(id)object forKey:(id <NSCopying>)key;

- (id)cachingObjectForKey:(id)key;

- (void)removeCachingObjectForKey:(id)key;

@end
