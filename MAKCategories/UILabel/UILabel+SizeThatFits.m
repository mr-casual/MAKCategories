//
//  UILabel+SizeThatFits.m
//  MAKToolKit
//
//  Created by Martin Kloepfel on 15.06.15.
//  Copyright (c) 2015 Martin Kloepfel. All rights reserved.
//

#import "UILabel+SizeThatFits.h"

#import "NSObject+MAKObjectCaching.h"


@implementation UILabel (SizeThatFits)

+ (CGSize)sizeThatFits:(CGSize)size text:(NSString *)text font:(UIFont *)font
{
    UILabel *label = [UILabel mak_staticInstance];
    
    [label mak_clear];
    
    label.text = text;
    label.font = font;
    
    return [label sizeThatFits:size];
}

+ (CGSize)sizeThatFits:(CGSize)size text:(NSString *)text font:(UIFont *)font useResultCaching:(BOOL)useResultCaching
{
    CGSize labelSize = CGSizeZero;
    
    if (useResultCaching)
    {
        NSString *cacheKey = [NSString stringWithFormat:@"UILabelSizeThatFits:%@ fontDescription:%@", NSStringFromCGSize(size), font.description];
        NSValue *cachedSizeValue = [text cachingObjectForKey:cacheKey];
        
        if (cachedSizeValue)
        {
            labelSize = cachedSizeValue.CGSizeValue;
        }
        else
        {
            labelSize = [UILabel sizeThatFits:size text:text font:font];
            [text setCachingObject:[NSValue valueWithCGSize:labelSize] forKey:cacheKey];
        }
    }
    return labelSize;
}


+ (CGSize)sizeThatFits:(CGSize)size attributedText:(NSAttributedString *)attributedText
{
    UILabel *label = [UILabel mak_staticInstance];
    
    [label mak_clear];
    label.attributedText = attributedText;
    
    return [label sizeThatFits:size];
}

+ (CGSize)sizeThatFits:(CGSize)size attributedText:(NSAttributedString *)attributedText useResultCaching:(BOOL)useResultCaching
{
    CGSize labelSize = CGSizeZero;
    
    if (useResultCaching)
    {
        NSString *cacheKey = [NSString stringWithFormat:@"UILabelSizeThatFits:%@", NSStringFromCGSize(size)];
        NSValue *cachedSizeValue = [attributedText cachingObjectForKey:cacheKey];
        
        if (cachedSizeValue)
        {
            labelSize = cachedSizeValue.CGSizeValue;
        }
        else
        {
            labelSize = [UILabel sizeThatFits:size attributedText:attributedText];
            [attributedText setCachingObject:[NSValue valueWithCGSize:labelSize] forKey:cacheKey];
        }
    }
    return labelSize;
}

+ (UILabel *)mak_staticInstance
{
    static UILabel *label;
    
    if (!label)
    {
        label = [UILabel new];
        label.numberOfLines = 0;
    }
    return label;
}

- (void)mak_clear
{
    self.text = nil;
    self.font = nil;
    self.attributedText = nil;
}

@end
