//
//  NSString+MAKAdditions.h
//  BranchChecker
//
//  Created by Martin Klöpfel on 22.12.13.
//  Copyright (c) 2013 Martin Klöpfel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MAKAdditions)

- (NSString *)substringBetweenString:(NSString *)start andString:(NSString *)end;

@end
