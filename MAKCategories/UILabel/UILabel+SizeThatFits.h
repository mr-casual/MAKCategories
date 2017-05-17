//
//  UILabel+SizeThatFits.h
//  MAKToolKit
//
//  Created by Martin Kloepfel on 15.06.15.
//  Copyright (c) 2015 Martin Kloepfel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (SizeThatFits)

// return 'best' size to fit given size. does not actually resize view. Default is return existing view size
+ (CGSize)sizeThatFits:(CGSize)size text:(NSString *)text font:(UIFont *)font;

+ (CGSize)sizeThatFits:(CGSize)size text:(NSString *)text font:(UIFont *)font useResultCaching:(BOOL)useResultCaching;


+ (CGSize)sizeThatFits:(CGSize)size attributedText:(NSAttributedString *)attributedText;

+ (CGSize)sizeThatFits:(CGSize)size attributedText:(NSAttributedString *)attributedText useResultCaching:(BOOL)useResultCaching;

@end
