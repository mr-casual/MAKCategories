//
//  NSLocale+Helper.m
//  MAKToolKit
//
//  Created by Martin Klöpfel on 19.01.15.
//  Copyright (c) 2014 Martin Klöpfel. All rights reserved.
//

#import "NSLocale+Helper.h"

@implementation NSLocale (Helper)

- (NSString *)languageCode
{
    return [self objectForKey:NSLocaleLanguageCode];
}

- (NSString *)countryCode
{
    return [self objectForKey:NSLocaleCountryCode];
}

- (NSString *)scriptCode
{
    return [self objectForKey:NSLocaleScriptCode];
}

- (NSString *)variantCode
{
    return [self objectForKey:NSLocaleVariantCode];
}

- (NSCharacterSet *)exemplarCharacterSet
{
    return [self objectForKey:NSLocaleExemplarCharacterSet];
}

- (NSCalendar *)calendar
{
    return [self objectForKey:NSLocaleCalendar];
}

- (NSString *)collationIdentifier
{
    return [self objectForKey:NSLocaleCollationIdentifier];
}

- (BOOL)usesMetricSystem
{
    return [(NSNumber *)[self objectForKey:NSLocaleUsesMetricSystem] boolValue];
}

- (NSString *)measurementSystem
{
    return [self objectForKey:NSLocaleMeasurementSystem];
}

- (NSString *)decimalSeparator
{
    return [self objectForKey:NSLocaleDecimalSeparator];
}

- (NSString *)groupingSeparator
{
    return [self objectForKey:NSLocaleGroupingSeparator];
}

- (NSString *)currencySymbol
{
    return [self objectForKey:NSLocaleCurrencySymbol];
}

- (NSString *)currencyCode
{
    return [self objectForKey:NSLocaleCurrencyCode];
}

- (NSString *)collatorIdentifier
{
    return [self objectForKey:NSLocaleCollatorIdentifier];
}

- (NSString *)quotationBeginDelimiterKey
{
    return [self objectForKey:NSLocaleQuotationBeginDelimiterKey];
}

- (NSString *)quotationEndDelimiterKey
{
    return [self objectForKey:NSLocaleQuotationEndDelimiterKey];
}

- (NSString *)alternateQuotationBeginDelimiterKey
{
    return [self objectForKey:NSLocaleAlternateQuotationBeginDelimiterKey];
}

- (NSString *)alternateQuotationEndDelimiterKey
{
    return [self objectForKey:NSLocaleAlternateQuotationEndDelimiterKey];
}

@end
