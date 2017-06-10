//
//  NSDictionary+JSON.h
//  Pods
//
//  Created by Roma Bakenbard on 10.06.17.
//
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JSON)

- (id)objectOrNilForKey:(NSString *)key;
- (NSInteger)integerForKey:(NSString *)key;
- (unsigned long long)unsignedLongLongForKey:(NSString *)key;
- (unsigned long)unsignedLongForKey:(NSString *)key;
- (float)floatForKey:(NSString *)key;
- (double)doubleForKey:(NSString *)key;
- (BOOL)boolForKey:(NSString *)key;
- (NSString *)stringForKey:(NSString *)key;

- (NSDate *)dateForKey:(NSString *)key;
- (NSDate *)dateFromTimestampForKey:(NSString *)key;
- (NSDate *)dateFromTimestampSecondsForKey:(NSString *)key;

@end
