//
//  NSURL+GetParameter.m
//  MAKToolKit
//
//  Created by Martin Klöpfel on 20.11.13.
//  Copyright (c) 2013 Martin Klöpfel. All rights reserved.
//

#if !__has_feature(objc_arc)
#error "This file requires ARC!"
#endif


#import "NSURL+GetParameter.h"
#import "NSString+Encoding.h"

@implementation NSURL (GetParameter)

+ (id)URLWithString:(NSString *)URLString getParameters:(NSDictionary*)parameters
{
    return [NSURL URLWithString:URLString getParameters:parameters useEncoding:YES];
}

+ (id)URLWithString:(NSString *)URLString getParameters:(NSDictionary*)parameters useEncoding:(BOOL)encode
{
    NSString* getParameterString = nil;
    
    if (parameters && [parameters isKindOfClass:[NSDictionary class]] && parameters.count != 0)
    {
        NSMutableArray* getParameterArray = [NSMutableArray array];
        for (NSString* key in parameters) {
            NSString* paramString = [NSString stringWithFormat:@"%@", [parameters objectForKey:key]];
            if (encode)
                paramString = [paramString stringByURLEncoding];
            
            [getParameterArray addObject:[NSString stringWithFormat:@"%@=%@", key, paramString]];
        }
        
        getParameterString = [getParameterArray componentsJoinedByString:@"&"];
    }
    
    NSURL* url;
	
	if(getParameterString != nil)
		url = [NSURL URLWithString:[NSString stringWithFormat:@"%@?%@", URLString, getParameterString]];
	else
		url = [NSURL URLWithString:URLString];
    
	return url;
}

- (NSDictionary *)getParameters
{
    NSString* getParameterString = self.getParameterString;
    
    if (!getParameterString) {
        return nil;
    }
    NSMutableDictionary* getParams = [NSMutableDictionary dictionary];
    NSArray* keyValuePairs = [getParameterString componentsSeparatedByString:@"&"];
    
    for (NSString* keyValuePair in keyValuePairs)
    {
        NSArray* pairComponents = [keyValuePair componentsSeparatedByString:@"="];
        NSString* key = [pairComponents objectAtIndex:0];
        NSString* value = [pairComponents objectAtIndex:1];
        
        [getParams setObject:[value stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding] forKey:key];
    }
    
    if (getParams.count == 0) {
        return nil;
    }
    
    return getParams;
}

- (NSString *)getParameterString
{
    NSRange range = [self.absoluteString rangeOfString:@"?"];
    if (range.location == NSNotFound)
        return nil;
    
    if (range.location+1 < self.absoluteString.length)
        return [self.absoluteString substringFromIndex:range.location+1];
    else
        return nil;
}

@end
