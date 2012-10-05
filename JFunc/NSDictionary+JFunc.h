//
//  NSDictionary+JFunc.h
//  JFunc
//
//  Created by Julien Fantin on 05/10/12.
//  Copyright (c) 2012 Julien Fantin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSDictionary * (^JFDictionaryMappingBlock)(id key, id obj);
@interface NSDictionary (JFunc)
- (NSArray *)toArray;
- (NSDictionary *)mapWithBlock:(JFDictionaryMappingBlock)block;
@end
