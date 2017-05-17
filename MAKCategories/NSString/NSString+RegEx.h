//
//  NSString+RegEx.h
//  BranchChecker
//
//  Created by Martin Klöpfel on 22.12.13.
//  Copyright (c) 2013 Martin Klöpfel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RegEx)

- (BOOL)matchRegexWithPattern:(NSString *)pattern;

- (NSString *)firstMatchOfPattern:(NSString *)pattern;

@end
