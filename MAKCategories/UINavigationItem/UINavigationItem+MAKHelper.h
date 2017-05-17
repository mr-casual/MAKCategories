//
//  UINavigationItem+MAKHelper.h
//  MAKCategories
//
//  Created by Martin Kloepfel on 02.06.15.
//  Copyright (c) 2014 Martin Kloepfel. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UINavigationItem (MAKHelper)

- (void)addLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem;

- (void)addRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem;

- (void)removeLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem;

- (void)removeRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem;

@end
