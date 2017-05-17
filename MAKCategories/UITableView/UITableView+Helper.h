//
//  UITableView+Helper.h
//  MAKToolKit
//
//  Created by Martin Klöpfel on 14.12.14.
//  Copyright (c) 2014 Martin Klöpfel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Helper)

- (void)registerCellWithNibNamed:(NSString *)nibName NS_AVAILABLE_IOS(5_0);
- (void)registerHeaderFooterViewWithNibNamed:(NSString *)nibName NS_AVAILABLE_IOS(6_0);

- (void)registerCellWithClass:(Class)class NS_AVAILABLE_IOS(6_0);
- (void)registerHeaderFooterViewWithClass:(Class)class NS_AVAILABLE_IOS(6_0);

- (id)dequeueReusableCellWithClass:(Class)class forIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0);
- (id)dequeueReusableHeaderFooterViewWithClass:(Class)class NS_AVAILABLE_IOS(6_0);

@end
