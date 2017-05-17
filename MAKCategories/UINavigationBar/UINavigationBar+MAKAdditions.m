//
//  UINavigationBar+MAKAdditions.m
//  MAKToolKit
//
//  Created by Martin Klöpfel on 17.06.14.
//  Copyright (c) 2014 Martin Klöpfel. All rights reserved.
//

#import "UINavigationBar+MAKAdditions.h"

@implementation UINavigationBar (MAKAdditions)

- (void)setTransparent
{
    self.translucent = YES;
    self.barTintColor = [UIColor clearColor];
    [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.backgroundColor = [UIColor clearColor];
    self.shadowImage = [UIImage new];
    self.opaque = NO;
}

- (void)restoreAppearance
{
    if([[UIDevice currentDevice].systemVersion floatValue] >= 8.0)
        self.translucent = [UINavigationBar appearance].translucent;
    else
        self.translucent = YES;
    self.barTintColor = [UINavigationBar appearance].barTintColor;
    [self setBackgroundImage:[[UINavigationBar appearance] backgroundImageForBarMetrics:UIBarMetricsDefault] forBarMetrics:UIBarMetricsDefault];
    self.backgroundColor = [UINavigationBar appearance].backgroundColor;
    self.shadowImage = [UINavigationBar appearance].shadowImage;
    self.opaque = [UINavigationBar appearance].opaque;
}

@end
