//
//  NSUserDefaults+Helper.h
//  MAKToolKit
//
//  Created by Martin Klöpfel on 28.02.14.
//  Copyright (c) 2014 Martin Klöpfel. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSUserDefaults (Helper)

#pragma mark -

- (void)synchronizeWithCompletion:(void (^)(BOOL success))completion;

/** Clear and save the complete database.
 *
 This method using grand central dispatch to save the data asynchronous with default priority.
 @param completion This block will be executed on completion
 */
- (void)clearWithCompletion:(void (^)(BOOL success))completion;


#pragma mark - 

- (id)objectForKey:(NSString *)key tryUnarchiveObject:(BOOL)tryUnarchiveObject;

- (NSArray *)arrayForKey:(NSString *)key tryUnarchiveObjects:(BOOL)tryUnarchiveObjects;


#pragma mark -

/** Set a floating-point value for the given key to the database and synchronize it in a detached background thread.
 *
 This method using grand central dispatch to save the data asynchronous with default priority.
 @param value The floating-point value to store in the defaults database.
 @param key The key
 */
- (void)saveFloatValue:(float)value forKey:(NSString*)key completion:(void (^)(BOOL success))completion;


/** Set a double value for the given key to the database and synchronize it in a detached background thread.
 *
 This method using grand central dispatch to save the data asynchronous with default priority.
 @param value The double value to store in the defaults database.
 @param key The key
 */
- (void)saveDoubleValue:(double)value forKey:(NSString*)key completion:(void (^)(BOOL success))completion;


/** Set an integer value for the given key to the database and synchronize it in a detached background thread.
 *
 This method using grand central dispatch to save the data asynchronous with default priority.
 @param value The integer value to store in the defaults database.
 @param key The key
 */
- (void)saveIntegerValue:(NSInteger)value forKey:(NSString*)key completion:(void (^)(BOOL success))completion;

/** Set a boolean value for the given key to the database and synchronize it in a detached background thread.
 *
 This method using grand central dispatch to save the data asynchronous with default priority.
 @param value The boolean value to store in the defaults database.
 @param key The key
 */
- (void)saveBoolValue:(BOOL)value forKey:(NSString*)key completion:(void (^)(BOOL success))completion;


/** Set an array for the given key to the database and synchronize it in the current thread.
 *
 This method using grand central dispatch to save the data asynchronous with default priority.
 @param array The array to store in the defaults database.
 @param key The key
 */
- (BOOL)saveArray:(NSArray *)array forKey:(NSString*)key tryArchiveObjects:(BOOL)tryArchiveObjects;


/** Set an object for the given key to the database and synchronize it in the current thread.
 @param object The object to store in the defaults database.
 @param key The key
 @return YES if the data was saved successfully to disk, otherwise NO.
 */
- (BOOL)saveObject:(id)object forKey:(NSString*)key tryArchiveObject:(BOOL)tryArchiveObject;


/** Set an object value for the given key to the database and synchronize it in a detached background thread.
 *
 This method using grand central dispatch to save the data asynchronous with default priority.
 @param value The object to store in the defaults database.
 @param key The key
 */
- (void)saveObject:(id)object forKey:(NSString*)key tryArchiveObject:(BOOL)tryArchiveObject completion:(void (^)(BOOL success))completion;


#pragma mark -

/** Remove an object for the given key from the database and synchronize it in a detached background thread.
 *
 This method using grand central dispatch to remove the data asynchronous with default priority.
 @param key The key
 */
- (void)removeObjectForKey:(NSString*)key completion:(void (^)(BOOL success))completion;


#pragma mark -

/** Register a timestamp for the given key.
 *
 This method saves the current date as timeinterval in the standard defaults database for a given key.
 @param key The key
 */
- (void)registerTimeStampForKey:(NSString*)key;


/** Register a perform count for the given key.
 *
 This method saves an integer count to the standard defaults database. Existing counts will be incremented.
 @param key The key
 */
- (void)registerPerformCountForKey:(NSString*)key;


/** Register a timestamp and perform count for the given keys.
 *
 This method saves the current date as timeinterval and an integer count to the standard defaults database. Existing counts will be incremented.
 @param timeStampKey The key to saving the timestamp
 @param performCountKey The key to saving the count
 */
- (void)registerTimeStampForKey:(NSString*)timeStampKey
       andPerformCountForKey:(NSString*)performCountKey;


/** Reset a registered timestamp for the given key.
 @param key The key
 */
- (void)resetTimeStampForKey:(NSString*)key;


/** Reset a perform count for the given key.
 @param timeStampKey The key
 */
- (void)resetPerformCountForKey:(NSString*)key;


/** Reset a registered timestamp for the given key.
 @param timeStampKey The key
 */
- (void)resetTimeStampForKey:(NSString*)timeStampKey
       andPerformCountForKey:(NSString*)performCountKey;





/** Check if a periodic feature should be perform for a given interval and the key for a registered timestamp @see registerTimeStampForKey: @see resetTimeStampForKey:
 @param timeStampKey The key
 @param performInterval The perform interval of your feature
 @return YES, if the interval since last perform is over or there is no registered timestamp for the given key (first perform)
 */
- (BOOL)shouldPerformPeriodicFeatureWithTimeStampKey:(NSString*)timeStampKey
                                    andPerformInterval:(NSTimeInterval)performInterval;


/** Check if a limited feature should be perform for a given maximum perform count and the key for a registered perform count @see registerPerformCountForKey: @see resetPerformCountForKey:
 @param performCountKey The key
 @param maxPerformCount The maximum perform count of your feature
 @return YES, if the perform count for the given key is lower then the maximum perform count or there is no registered perform count for the given key (first perform)
 */
- (BOOL)shouldPerformFeatureWithPerformCountKey:(NSString*)performCountKey
                             andMaxPerformCount:(NSUInteger)maxPerformCount;


/** Check if a periodic feature should be perform for a given interval, the key for a registered timestamp, a maximum perform count and the key for a registered perform count @see registerTimeStampForKey:andPerformCountForKey @see resetTimeStampForKey:andPerformCountForKey
 *
 @param timeStampKey The key for a registered timestamp
 @param performInterval The perform interval of your feature
 @param performCountKey The key for a registered perform count
 @param maxPerformCount The maximum perform count of your feature
 @return YES, if the interval since last perform is over and the perform count for the given key is lower then the maximum perform count or there is no registered timestamp and maxPerformCount for the given keys (first perform)
 */
- (BOOL)shouldPerformPeriodicFeatureWithTimeStampKey:(NSString*)timeStampKey
                                    performInterval:(NSTimeInterval)performInterval
                                     performCountKey:(NSString*)performCountKey
                                     andMaxPerformCount:(NSUInteger)maxPerformCount;


@end
