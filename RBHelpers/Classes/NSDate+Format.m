//
//  NSDate+Format.m
//  Pods
//
//  Created by Roma Bakenbard on 10.06.17.
//
//

#import "NSDate+Format.h"

@implementation NSDate (Format)

+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format
{
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        dateFormatter = [NSDateFormatter new];
    });
    
    NSString *dateFormat = format;
    if (dateFormat.length > string.length) {
        dateFormat = [dateFormat substringToIndex:string.length];
    }
    
    dateFormatter.dateFormat = dateFormat;
    return [dateFormatter dateFromString:string];
}

- (NSString *)stringWithFormat:(NSString *)format
{
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        dateFormatter = [NSDateFormatter new];
    });
    
    dateFormatter.dateFormat = format;
    return [dateFormatter stringFromDate:self];
}

@end
