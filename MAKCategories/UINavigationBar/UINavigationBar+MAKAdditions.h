//
//  UINavigationBar+MAKAdditions.h
//  MAKToolKit
//
//  Created by Martin Klöpfel on 17.06.14.
//  Copyright (c) 2014 Martin Klöpfel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (MAKAdditions)

/**
 Set the navigation bar completely transparent
 */
- (void)setTransparent;

/**
 Restore all ui appearance parameters
 */
- (void)restoreAppearance;

@end
