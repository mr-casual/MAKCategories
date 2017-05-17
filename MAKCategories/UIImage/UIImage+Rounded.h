//
//  UIImage+Rounded.h
//  MAKToolKit
//
//  Created by Martin Klöpfel on 05.02.14.
//  Copyright (c) 2014 Martin Klöpfel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Rounded)

- (UIImage *)roundedImage;
- (UIImage *)roundedImageWithBackgroundColor:(UIColor*)color;

- (UIImage *)imageWithRoundCorners:(CGFloat)radius;
- (UIImage *)imageWithRoundCorners:(CGFloat)radius backgroundColor:(UIColor*)color;

/**
 Create an image rectangle with the given color and size.
 @note The image context is opaque.
 @param color The fill color of the rectangle.
 @param size The size of the rectangle.
 @return The created image.
*/
+ (UIImage *)imageWithColor:(UIColor*)color size:(CGSize)size;

+ (UIImage *)resizableImageWithColor:(UIColor*)color;
+ (UIImage *)resizableImageWithColor:(UIColor*)color cornerRadius:(CGFloat)radius;

+ (UIImage *)resizableImageWithColor:(UIColor*)color roundingCorners:(UIRectCorner)corners cornerRadius:(CGFloat)radius;

@end
