//
//  UIImage+Rounded.m
//  MAKToolKit
//
//  Created by Martin Klöpfel on 05.02.14.
//  Copyright (c) 2014 Martin Klöpfel. All rights reserved.
//

#import "UIImage+Rounded.h"


@implementation UIImage (Rounded)


- (UIImage*)roundedImage
{
    return [self roundedImageWithBackgroundColor:nil];
}

- (UIImage*)roundedImageWithBackgroundColor:(UIColor*)color
{
    return [self imageWithRoundCorners:floor(self.size.width*0.5) backgroundColor:color];
}

- (UIImage*)imageWithRoundCorners:(CGFloat)radius
{
    return [self imageWithRoundCorners:radius backgroundColor:nil];
}

- (UIImage*)imageWithRoundCorners:(CGFloat)radius backgroundColor:(UIColor*)color
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGAffineTransform flipVertical = CGAffineTransformMake(1, 0, 0, -1, 0, self.size.height);
    CGContextConcatCTM(context, flipVertical);
    
    CGContextAddPath(context, [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0.0, 0.0, self.size.width, self.size.height) cornerRadius:radius].CGPath);
    CGContextClip(context);
    
    if (color)
    {
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillRect(context, CGRectMake(0.0, 0.0, self.size.width, self.size.height));
    }
    CGContextDrawImage(context, CGRectMake(0, 0, self.size.width, self.size.height), self.CGImage);
    
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


+ (UIImage *)imageWithColor:(UIColor*)color size:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, CGRectMake(0.0, 0.0, size.width, size.height));
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage*)resizableImageWithColor:(UIColor*)color
{
    return [UIImage resizableImageWithColor:color cornerRadius:0];
}

+ (UIImage*)resizableImageWithColor:(UIColor*)color cornerRadius:(CGFloat)radius
{
    if (radius == 0.0)
    {
        UIImage *image = [UIImage imageWithColor:color size:CGSizeMake(1.0, 1.0)];
        return [image resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode: UIImageResizingModeStretch];
    }

    CGSize size = CGSizeMake(radius*2+1, radius*2+1);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextAddPath(context, [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0.0, 0.0, size.width, size.height) cornerRadius:radius].CGPath);
    
    CGContextSetFillColorWithColor(context, color ? color.CGColor : [UIColor whiteColor].CGColor);
    CGContextDrawPath(context, kCGPathFill);
    
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(radius, radius, radius, radius) resizingMode: UIImageResizingModeStretch];
}


+ (UIImage *)resizableImageWithColor:(UIColor*)color roundingCorners:(UIRectCorner)corners cornerRadius:(CGFloat)radius
{
    if (corners == UIRectCornerAllCorners)
    {
        return [UIImage resizableImageWithColor:color cornerRadius:radius];
    }
    else
    {
        CGSize size = CGSizeMake((corners & UIRectCornerBottomLeft || corners & UIRectCornerTopLeft)*radius+(corners & UIRectCornerBottomRight || corners & UIRectCornerTopRight)*radius+1,
                                 (corners & UIRectCornerTopLeft || corners & UIRectCornerTopRight)*radius+(corners & UIRectCornerBottomLeft || corners & UIRectCornerBottomRight)*radius+1);
        
        UIGraphicsBeginImageContextWithOptions(size, NO, 0);
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextAddPath(context, [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0.0, 0.0, size.width, size.height) byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)].CGPath);

        CGContextSetFillColorWithColor(context, color ? color.CGColor : [UIColor whiteColor].CGColor);
        CGContextDrawPath(context, kCGPathFill);
        
        UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return [image resizableImageWithCapInsets:UIEdgeInsetsMake((corners & UIRectCornerTopLeft || corners & UIRectCornerTopRight)*radius,
                                                                   (corners & UIRectCornerTopLeft || corners & UIRectCornerBottomLeft)*radius,
                                                                   (corners & UIRectCornerBottomLeft || corners & UIRectCornerBottomRight)*radius,
                                                                   (corners & UIRectCornerTopRight || corners & UIRectCornerBottomRight)*radius) resizingMode: UIImageResizingModeStretch];
    }
}

@end
