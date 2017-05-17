//
//  UINib+Helper.h
//  MAKToolKit
//
//  Created by Martin Klöpfel on 12.01.15.
//  Copyright (c) 2014 Martin Klöpfel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (Helper)

+ (UINib *)nibForClass:(Class)viewClass bundle:(NSBundle *)bundleOrNil;

@end
