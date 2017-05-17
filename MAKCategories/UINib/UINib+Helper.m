//
//  UINib+Helper.m
//  MAKToolKit
//
//  Created by Martin Klöpfel on 12.01.15.
//  Copyright (c) 2014 Martin Klöpfel. All rights reserved.
//

#import "UINib+Helper.h"

@implementation UINib (Helper)

+ (UINib *)nibForClass:(Class)viewClass bundle:(NSBundle *)bundleOrNil
{
    return [UINib nibWithNibName:NSStringFromClass(viewClass) bundle:bundleOrNil];
}

@end
