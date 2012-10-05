//
//  NSDictionary+JFunc.m
//  JFunc
//
//  Created by Julien Fantin on 05/10/12.
//  Copyright (c) 2012 Julien Fantin. All rights reserved.
//

#import "NSDictionary+JFunc.h"

@implementation NSDictionary (JFunc)

- (NSArray *)toArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[[self allValues] count]];
    
    for (id key in [self allKeys]) {
        NSArray *row = @[key, [self objectForKey:key]];
        [array addObject:row];
    }
    
    return [NSArray arrayWithArray:array];
}

- (NSDictionary *)mapWithBlock:(JFDictionaryMappingBlock)block
{
    NSMutableDictionary *map = [NSMutableDictionary dictionaryWithCapacity:[self count]];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSDictionary *result = block(key, obj);
        if (result != nil) {
            NSParameterAssert([[result allKeys] count] < 2);
            id resKey = [[result allKeys] objectAtIndex:0];
            id resObj = [[result allValues] objectAtIndex:0];
            [map setObject:resObj forKey:resKey];
        }
    }];

    return [NSDictionary dictionaryWithDictionary:map];
}

@end
