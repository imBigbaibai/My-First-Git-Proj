//
//  NSObject+JSON.h
//  HHP4_ios
//
//  Created by tangdaojuan on 15/9/21.
//  Copyright © 2015年 tangdaojuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JSON)
- (NSString *)JSONStringWithOptions:(NSJSONWritingOptions)options error:(NSError **)error;
@end

@interface NSArray (JSON)
- (NSString *)JSONString; //override MJExtentsion JSONString method
@end

@interface NSDictionary (JSON)
- (NSString *)JSONString;
@end

@interface NSString (JSON)
- (id)objectFromJSONString;
- (id)objectFromJSONStringWithOptions:(NSJSONReadingOptions)options;
- (id)objectFromJSONStringWithOptions:(NSJSONReadingOptions)options error:(NSError * __autoreleasing *)error;
@end
