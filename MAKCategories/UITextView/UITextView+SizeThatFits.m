//
//  UITextView+SizeThatFits.m
//  MAKToolKit
//
//  Created by Martin Kloepfel on 15.06.15.
//  Copyright (c) 2015 Martin Kloepfel. All rights reserved.
//

#import "UITextView+SizeThatFits.h"

#import "NSObject+MAKObjectCaching.h"


@implementation UITextView (SizeThatFits)


+ (CGSize)sizeThatFits:(CGSize)size text:(NSString *)text font:(UIFont *)font
{
    UITextView *textView = [UITextView mak_staticInstance];
    
    [textView mak_clear];
    
    textView.text = text;
    textView.font = font;
    
    return [textView sizeThatFits:size];
}

+ (CGSize)sizeThatFits:(CGSize)size text:(NSString *)text font:(UIFont *)font useResultCaching:(BOOL)useResultCaching
{
    CGSize textViewSize = CGSizeZero;
    
    if (useResultCaching)
    {
        NSString *cacheKey = [NSString stringWithFormat:@"UITextViewSizeThatFits:%@ fontDescription:%@", NSStringFromCGSize(size), font.description];
        NSValue *cachedSizeValue = [text cachingObjectForKey:cacheKey];
        
        if (cachedSizeValue)
        {
            textViewSize = cachedSizeValue.CGSizeValue;
        }
        else
        {
            textViewSize = [UITextView sizeThatFits:size text:text font:font];
            [text setCachingObject:[NSValue valueWithCGSize:textViewSize] forKey:cacheKey];
        }
    }
    return textViewSize;
}

+ (CGSize)sizeThatFits:(CGSize)size attributedText:(NSAttributedString *)attributedText
{
    UITextView *textView = [UITextView mak_staticInstance];
    
    [textView mak_clear];
    textView.attributedText = attributedText;
    
    return [textView sizeThatFits:size];
}

+ (CGSize)sizeThatFits:(CGSize)size attributedText:(NSAttributedString *)attributedText useResultCaching:(BOOL)useResultCaching
{
    CGSize textViewSize = CGSizeZero;
    
    if (useResultCaching)
    {
        NSString *cacheKey = [NSString stringWithFormat:@"UITextViewSizeThatFits:%@", NSStringFromCGSize(size)];
        NSValue *cachedSizeValue = [attributedText cachingObjectForKey:cacheKey];
        
        if (cachedSizeValue)
        {
            textViewSize = cachedSizeValue.CGSizeValue;
        }
        else
        {
            textViewSize = [UITextView sizeThatFits:size attributedText:attributedText];
            [attributedText setCachingObject:[NSValue valueWithCGSize:textViewSize] forKey:cacheKey];
        }
    }
    return textViewSize;
}

+ (UITextView *)mak_staticInstance
{
    static UITextView *textView;
    
    if (!textView)
        textView = [UITextView new];

    return textView;
}

- (void)mak_clear
{
    self.text = nil;
    self.font = nil;
    self.attributedText = nil;
}



@end
