//
//  NSDictionary+Helper.h
//  MAKToolKit
//
//  Created by Martin Klöpfel on 28.01.14.
//  Copyright (c) 2014 Martin Klöpfel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Helper)

- (float)floatValueForKey:(NSString*)key;

- (double)doubleValueForKey:(NSString*)key;

- (unsigned int)unsignedIntValueForKey:(NSString*)key;

- (NSInteger)integerValueForKey:(NSString*)key;

- (NSUInteger)unsignedIntegerValueForKey:(NSString*)key;

- (BOOL)boolValueForKey:(NSString*)key;

- (NSString*)stringForKey:(NSString*)key;

- (NSArray*)arrayForKey:(NSString*)key;

- (NSDictionary*)dictionaryForKey:(NSString*)key;

@end
