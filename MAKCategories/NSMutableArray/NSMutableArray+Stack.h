//
//  NSMutableArray+Stack.h
//  MAKToolKit
//
//  Created by Martin Klöpfel on 11.04.14.
//  Copyright (c) 2014 Martin Klöpfel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Stack)

- (void)push:(id)obj;
- (id)pop;

@end
