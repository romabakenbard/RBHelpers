//
//  NSDictionary+JSON.m
//  Pods
//
//  Created by Roma Bakenbard on 10.06.17.
//
//

#import "NSDictionary+JSON.h"
#import "NSDate+Format.h"

@interface NSNull (JSON)
@end

@implementation NSNull (JSON)

- (NSUInteger)length { return 0; }

- (NSInteger)integerValue { return 0; };
- (int)intValue { return 0; }
- (unsigned int)unsignedIntValue { return 0; }

- (long)longValue { return 0; }
- (unsigned long)unsignedLongValue { return 0; };

- (long long)longLongValue { return 0; }
- (unsigned long long)unsignedLongLongValue { return 0; };

- (double)doubleValue { return 0; };
- (float)floatValue { return 0; };
- (BOOL)boolValue { return NO; }

- (NSString *)stringValue { return nil; }

- (NSArray *)componentsSeparatedByString:(NSString *)separator { return @[]; }

- (id)objectForKey:(id)key { return nil; }

@end

@implementation NSDictionary (JSON)


- (BOOL)_fb_isNull:(id)object {
    if ((object == nil) || (object == NULL) || (object == [NSNull null])) {
        return YES;
    } else {
        return NO;
    }
}

- (NSNumber *)_fb_numberForKey:(NSString *)key
{
    id object = [self objectOrNilForKey:key];
    if ([object isKindOfClass:[NSNumber class]] || [object isKindOfClass:[NSString class]]) {
        return object;
    }
    return nil;
}

- (id)objectOrNilForKey:(NSString *)key
{
    id object = [self objectForKey:key];
    if ([self _fb_isNull:object]) return nil;
    return object;
}

- (NSInteger)integerForKey:(NSString *)key
{
    id object = [self _fb_numberForKey:key];
    if ([object respondsToSelector:@selector(integerValue)]) {
        return [object integerValue];
    }
    return 0;
}

- (unsigned long long)unsignedLongLongForKey:(NSString *)key
{
    id object = [self _fb_numberForKey:key];
    if ([object respondsToSelector:@selector(unsignedLongLongValue)]) {
        return [object unsignedLongLongValue];
    }
    return 0;
}

- (unsigned long)unsignedLongForKey:(NSString *)key
{
    id object = [self _fb_numberForKey:key];
    if ([object respondsToSelector:@selector(unsignedLongValue)]) {
        return [object unsignedLongValue];
    }
    return 0;
}

- (float)floatForKey:(NSString *)key
{
    id object = [self _fb_numberForKey:key];
    if ([object respondsToSelector:@selector(floatValue)]) {
        return [object floatValue];
    }
    return 0;
}

- (double)doubleForKey:(NSString *)key
{
    id object = [self _fb_numberForKey:key];
    if ([object respondsToSelector:@selector(doubleValue)]) {
        return [object doubleValue];
    }
    return 0;
}

- (BOOL)boolForKey:(NSString *)key
{
    id object = [self _fb_numberForKey:key];
    if ([object respondsToSelector:@selector(boolValue)]) {
        return [object boolValue];
    }
    return NO;
}

- (NSString *)stringForKey:(NSString *)key
{
    id object = [self objectOrNilForKey:key];
    if (object) {
        if ([object isKindOfClass:[NSString class]]) {
            return object;
        } else {
            return [NSString stringWithFormat:@"%@", object];
        }
    } else {
        return nil;
    }
}

- (NSDate *)dateForKey:(NSString *)key
{
    NSString *string = [self stringForKey:key];
    if (string) {
        return [NSDate dateFromString:string withFormat:@"dd.MM.yyyy HH:mm:ss"];
    }
    return nil;
}

- (NSDate *)dateFromTimestampForKey:(NSString *)key
{
    double timeStampValue = [self doubleForKey:key];
    if (timeStampValue == 0) {
        return nil;
    }
    NSTimeInterval timeStamp = timeStampValue / 1000;
    return [NSDate dateWithTimeIntervalSince1970:timeStamp];
}

- (NSDate *)dateFromTimestampSecondsForKey:(NSString *)key
{
    double timeStampValue = [self doubleForKey:key];
    if (timeStampValue == 0) {
        return nil;
    }
    return [NSDate dateWithTimeIntervalSince1970:timeStampValue];
}

@end
