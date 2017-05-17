//
//  NSMutableArray+Stack.m
//  MAKToolKit
//
//  Created by Martin Klöpfel on 11.04.14.
//  Copyright (c) 2014 Martin Klöpfel. All rights reserved.
//

#import "NSMutableArray+Stack.h"

@implementation NSMutableArray (Stack)

- (void)push:(id)obj
{
    if (!obj)
        return;
    
    [self insertObject:obj atIndex:0];
}


- (id)pop
{
	if(self.count > 0)
	{
		id obj = self.lastObject;
		[self removeLastObject];
		return obj;
	}
    return nil;
}

@end
