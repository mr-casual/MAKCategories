//
//  NSDictionary+Helper.m
//  MAKToolKit
//
//  Created by Martin Klöpfel on 28.01.14.
//  Copyright (c) 2014 Martin Klöpfel. All rights reserved.
//

#import "NSDictionary+Helper.h"

@implementation NSDictionary (Helper)

- (float)floatValueForKey:(NSString*)key
{
	if(!key || ![key isKindOfClass:[NSString class]] || key.length == 0)
		return 0.0f;
	
	id value = [self objectForKey:key];
	
	if(!value || value == [NSNull null])
		return 0.0f;
	
	if([value isKindOfClass:[NSString class]])
		return [value floatValue];
	
	if([value isKindOfClass:[NSNumber class]])
		return [value floatValue];
    
    return 0.0f;
}

- (double)doubleValueForKey:(NSString*)key
{
	if(!key || ![key isKindOfClass:[NSString class]] || key.length == 0)
		return 0.0;
	
	id value = [self objectForKey:key];
	
	if(!value || value == [NSNull null])
		return 0.0;
	
	if([value isKindOfClass:[NSString class]])
		return [value doubleValue];
	
	if([value isKindOfClass:[NSNumber class]])
		return [value doubleValue];
    
    return 0.0;
}

- (int)intValueForKey:(NSString*)key
{
	if(!key || ![key isKindOfClass:[NSString class]] || key.length == 0)
		return 0;
	
	id value = [self objectForKey:key];
	
	if(!value || value == [NSNull null])
		return 0;
	
	if([value isKindOfClass:[NSString class]])
		return [value intValue];
	
	if([value isKindOfClass:[NSNumber class]])
		return [value intValue];
    
    return 0;
}

- (unsigned int)unsignedIntValueForKey:(NSString*)key
{
    if(!key || ![key isKindOfClass:[NSString class]] || key.length == 0)
        return 0;
    
    id value = [self objectForKey:key];
    
    if(!value || value == [NSNull null])
        return 0;
    
    if([value isKindOfClass:[NSString class]])
        return [value unsignedIntValue];
    
    if([value isKindOfClass:[NSNumber class]])
        return [value unsignedIntValue];
    
    return 0;
}

- (NSInteger)integerValueForKey:(NSString*)key
{
	if(!key || ![key isKindOfClass:[NSString class]] || key.length == 0)
		return 0;
	
	id value = [self objectForKey:key];
	
	if(!value || value == [NSNull null])
		return 0;
    
	if([value isKindOfClass:[NSString class]])
		return [value integerValue];
	
	if([value isKindOfClass:[NSNumber class]])
		return [value integerValue];
    
    return 0;
}

- (NSUInteger)unsignedIntegerValueForKey:(NSString*)key
{
    if(!key || ![key isKindOfClass:[NSString class]] || key.length == 0)
        return 0;
    
    id value = [self objectForKey:key];
    
    if(!value || value == [NSNull null])
        return 0;
    
    if([value isKindOfClass:[NSString class]])
        return [value unsignedIntegerValue];
    
    if([value isKindOfClass:[NSNumber class]])
        return [value unsignedIntegerValue];
    
    return 0;
}

- (BOOL)boolValueForKey:(NSString*)key
{
	if(!key || ![key isKindOfClass:[NSString class]] || key.length == 0)
		return NO;
	
	id value = [self objectForKey:key];
	
	if(!value || value == [NSNull null])
		return NO;
	
	if([value isKindOfClass:[NSString class]])
		return [value boolValue];
	
	if([value isKindOfClass:[NSNumber class]])
		return [value boolValue];
    
    return NO;
}

- (NSString*)stringForKey:(NSString*)key
{
	if(!key || ![key isKindOfClass:[NSString class]] || key.length == 0)
		return nil;
	
	id value = [self objectForKey:key];
	
	if(!value || value == [NSNull null] || ![value isKindOfClass:[NSString class]])
		return nil;
	
	return [NSString stringWithFormat:@"%@",value];
}

- (NSArray*)arrayForKey:(NSString*)key
{
	if(!key || ![key isKindOfClass:[NSString class]] || key.length == 0)
		return nil;
	
	id value = [self objectForKey:key];
	
	if(!value || value == [NSNull null] || ![value isKindOfClass:[NSArray class]])
		return nil;
	
	return [NSArray arrayWithArray:value];
}

- (NSDictionary*)dictionaryForKey:(NSString*)key
{
	if(!key || ![key isKindOfClass:[NSString class]] || key.length == 0)
		return nil;
	
	id value = [self objectForKey:key];
	
	if(!value || value == [NSNull null] || ![value isKindOfClass:[NSDictionary class]])
		return nil;
	
	return [NSDictionary dictionaryWithDictionary:value];
}

@end
