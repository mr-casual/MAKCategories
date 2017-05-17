//
//  NSURL+GetParameter.h
//  MAKToolKit
//
//  Created by Martin Klöpfel on 20.11.13.
//  Copyright (c) 2013 Martin Klöpfel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (GetParameter)

+ (id)URLWithString:(NSString *)URLString getParameters:(NSDictionary *)parameters;
+ (id)URLWithString:(NSString *)URLString getParameters:(NSDictionary *)parameters useEncoding:(BOOL)encode;

- (NSDictionary *)getParameters;
- (NSString *)getParameterString;

@end
