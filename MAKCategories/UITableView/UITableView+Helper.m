//
//  UITableView+Helper.m
//  MAKToolKit
//
//  Created by Martin Klöpfel on 14.12.14.
//  Copyright (c) 2014 Martin Klöpfel. All rights reserved.
//

#import "UITableView+Helper.h"


@implementation UITableView (Helper)

- (void)registerCellWithNibNamed:(NSString *)nibName
{
    UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
    if (nib)
        [self registerNib:nib forCellReuseIdentifier:nibName];
}

- (void)registerHeaderFooterViewWithNibNamed:(NSString *)nibName
{
    UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
    if (nib)
        [self registerNib:nib forHeaderFooterViewReuseIdentifier:nibName];
}

- (void)registerCellWithClass:(Class)class
{
    [self registerClass:class forCellReuseIdentifier:NSStringFromClass(class)];
}

- (void)registerHeaderFooterViewWithClass:(Class)class
{
    [self registerClass:class forHeaderFooterViewReuseIdentifier:NSStringFromClass(class)];
}

- (id)dequeueReusableCellWithClass:(Class)class forIndexPath:(NSIndexPath *)indexPath
{
    return [self dequeueReusableCellWithIdentifier:NSStringFromClass(class) forIndexPath:indexPath];
}

- (id)dequeueReusableHeaderFooterViewWithClass:(Class)class
{
    return [self dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass(class)];
}

@end
