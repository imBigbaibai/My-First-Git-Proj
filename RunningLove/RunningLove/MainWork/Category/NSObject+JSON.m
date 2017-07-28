//
//  NSObject+JSON.m
//  HHP4_ios
//
//  Created by tangdaojuan on 15/9/21.
//  Copyright © 2015年 tangdaojuan. All rights reserved.
//

#import "NSObject+JSON.h"

@implementation NSObject (JSON)

- (NSString *)JSONStringWithOptions:(NSJSONWritingOptions)options error:(NSError **)error
{
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:self options:options error:error];
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}

@end

@implementation NSArray (JSON)

- (NSString *)JSONString
{
    return [self JSONStringWithOptions:0 error:nil];
}

@end

@implementation NSDictionary (JSON)

- (NSString *)JSONString
{
    return [self JSONStringWithOptions:0 error:nil];
}

@end

@implementation NSString (JSON)

- (id)objectFromJSONString
{
    return [self objectFromJSONStringWithOptions:0];
}

- (id)objectFromJSONStringWithOptions:(NSJSONReadingOptions)options
{
    return [self objectFromJSONStringWithOptions:options error:nil];
}

- (id)objectFromJSONStringWithOptions:(NSJSONReadingOptions)options error:(NSError * __autoreleasing*)error
{
    return [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding] options:options error:error];
}


@end
