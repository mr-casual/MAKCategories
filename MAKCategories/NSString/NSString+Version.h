//
//  NSString+Version.h
//  MAKToolKit
//
//  Created by Martin Klöpfel on 04.06.14.
//  Copyright (c) 2014 Martin Klöpfel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Version)

/** Compare the string with a other given version string.
 *
 @note This method don't support special release version strings like "1.0RC1" or something like that. (1.0a is supported)
 @param version The version string to compare
 @return the comparison result
 */
- (NSComparisonResult)compareWithVersion:(NSString*)version;


/** Compare one version string with a other version string.
 *
 @note This method don't support special release version strings like "1.0RC1" or something like that. (1.0a is supported)
 @param leftVersion The left version string
 @param rightVersion The right version string
 @return the comparison result
 */
+ (NSComparisonResult)compareVersion:(NSString*)leftVersion withVersion:(NSString*)rightVersion;

@end
