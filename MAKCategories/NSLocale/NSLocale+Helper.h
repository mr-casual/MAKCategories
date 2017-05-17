//
//  NSLocale+Helper.h
//  MAKToolKit
//
//  Created by Martin Klöpfel on 19.01.15.
//  Copyright (c) 2014 Martin Klöpfel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSLocale (Helper)

@property (nonatomic, copy, readonly) NSString *languageCode;

@property (nonatomic, copy, readonly) NSString *countryCode;

@property (nonatomic, copy, readonly) NSString *scriptCode;

@property (nonatomic, copy, readonly) NSString *variantCode;

@property (nonatomic, copy, readonly) NSCharacterSet *exemplarCharacterSet;

@property (nonatomic, copy, readonly) NSCalendar *calendar;

@property (nonatomic, copy, readonly) NSString *collationIdentifier;

@property (nonatomic) BOOL usesMetricSystem;

@property (nonatomic, copy, readonly) NSString *measurementSystem;

@property (nonatomic, copy, readonly) NSString *decimalSeparator;

@property (nonatomic, copy, readonly) NSString *groupingSeparator;

@property (nonatomic, copy, readonly) NSString *currencySymbol;

@property (nonatomic, copy, readonly) NSString *currencyCode;

@property (nonatomic, copy, readonly) NSString *collatorIdentifier;

@property (nonatomic, copy, readonly) NSString *quotationBeginDelimiterKey;

@property (nonatomic, copy, readonly) NSString *quotationEndDelimiterKey;

@property (nonatomic, copy, readonly) NSString *alternateQuotationBeginDelimiterKey;

@property (nonatomic, copy, readonly) NSString *alternateQuotationEndDelimiterKey;

@end
