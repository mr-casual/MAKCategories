//
//  UINavigationItem+MAKHelper.h
//  MAKCategories
//
//  Created by Martin Kloepfel on 02.06.15.
//  Copyright (c) 2014 Martin Kloepfel. All rights reserved.
//

#import "UINavigationItem+MAKHelper.h"


@implementation UINavigationItem (MAKHelper)

- (void)addLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem
{
    if (![leftBarButtonItem isKindOfClass:[UIBarButtonItem class]])
        MAKRaiseInvalidArgumentException(leftBarButtonItem);
    
    NSMutableArray *leftBarButtonItems = [NSMutableArray arrayWithArray:self.leftBarButtonItems];
    [leftBarButtonItems addObject:leftBarButtonItem];
    
    self.leftBarButtonItems = [NSArray arrayWithArray:leftBarButtonItems];
}

- (void)addRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem
{
    if (![rightBarButtonItem isKindOfClass:[UIBarButtonItem class]])
        MAKRaiseInvalidArgumentException(rightBarButtonItem);
    
    NSMutableArray *rightBarButtonItems = [NSMutableArray arrayWithArray:self.rightBarButtonItems];
    [rightBarButtonItems addObject:rightBarButtonItem];
    
    self.rightBarButtonItems = [NSArray arrayWithArray:rightBarButtonItems];
}


- (void)removeLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem
{
    if (![leftBarButtonItem isKindOfClass:[UIBarButtonItem class]])
        MAKRaiseInvalidArgumentException(leftBarButtonItem);
    
    if ([self.leftBarButtonItems containsObject:leftBarButtonItem])
    {
        NSMutableArray *leftBarButtonItems = [NSMutableArray arrayWithArray:self.leftBarButtonItems];
        [leftBarButtonItems removeObject:leftBarButtonItem];
        
        self.leftBarButtonItems = [NSArray arrayWithArray:leftBarButtonItems];
    }
}

- (void)removeRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem
{
    if (![rightBarButtonItem isKindOfClass:[UIBarButtonItem class]])
        MAKRaiseInvalidArgumentException(rightBarButtonItem);
    
    if ([self.rightBarButtonItems containsObject:rightBarButtonItem])
    {
        NSMutableArray *rightBarButtonItems = [NSMutableArray arrayWithArray:self.rightBarButtonItems];
        [rightBarButtonItems removeObject:rightBarButtonItem];
        
        self.leftBarButtonItems = [NSArray arrayWithArray:rightBarButtonItems];
    }
}

@end
