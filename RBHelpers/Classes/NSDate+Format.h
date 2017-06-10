//
//  NSDate+Format.h
//  Pods
//
//  Created by Roma Bakenbard on 10.06.17.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (Format)

+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format;
- (NSString *)stringWithFormat:(NSString *)format;

@end
