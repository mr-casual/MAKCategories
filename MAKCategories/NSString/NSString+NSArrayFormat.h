//
//  NSString+NSArrayFormat.h
//  MAKToolKit
//
//  Created by Martin Klöpfel on 04.07.13.
//  Copyright (c) 2013 Martin Klöpfel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NSArrayFormat)

+ (id)stringWithFormat:(NSString *)format arguments:(NSArray *)arguments;

@end
