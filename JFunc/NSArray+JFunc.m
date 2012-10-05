//
//  NSArray+JFunc.m
//  JFunc
//
//  Created by Julien Fantin on 05/10/12.
//  Copyright (c) 2012 Julien Fantin. All rights reserved.
//

#import "NSArray+JFunc.h"

@implementation NSArray (JFunc)

#pragma - dictionary

- (NSDictionary *)toDictionary
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:[self count]];
    
    for (id tuple in self) {
        
        if (NO == [tuple isKindOfClass:[NSArray class]]) {
            continue;
        }
        
        id key = [tuple objectAtIndex:0];
        id obj = [tuple objectAtIndex:1];
        [dict setObject:obj forKey:key];
    }
    
    return [NSDictionary dictionaryWithDictionary:dict];
}

#pragma - range

+ (NSArray *)arrayWithRange:(NSRange)range
{
    NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:range];

    NSMutableArray *array = [NSMutableArray arrayWithCapacity:set.count];
    
    [set enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
        [array addObject:@((NSInteger) idx)];
    }];
    
    return [NSArray arrayWithArray:array];
}

#pragma - map

- (NSArray *)mapWithBlock:(JFuncMappingBlock)block
{
    NSMutableArray *map = [NSMutableArray arrayWithCapacity:[self count]];

    for (id obj in self) {
        [map addObject:block(obj)];
    }
    
    return [NSArray arrayWithArray:map];
}

#pragma - reduce

- (id)reduce:(id)acumulator withBlock:(JFuncReducingBlock)block
{
    for (id obj in self) {
        acumulator = block(acumulator, obj);
    }
    return acumulator;
}

#pragma - filter

- (NSArray *)filteredArrayUsingBlock:(JFuncEnumeratedMappingBlock)block
{
    NSMutableArray *filter = [NSMutableArray arrayWithCapacity:[self count]];
    for (id obj in self) {
        int index = [self indexOfObject:obj];
        id result = block(index, obj);
        if (result != nil) {
            [filter addObject:result];
        }
    }
    return [NSArray arrayWithArray:filter];
}

#pragma -partition

- (NSArray *)partitionWithStep:(NSUInteger)step
{
    return [self partitionWithItems:step andStep:step];
}

- (NSArray *)partitionWithItems:(NSUInteger)items andStep:(NSUInteger)step
{
    NSMutableArray *partition = [NSMutableArray array];
    NSUInteger count = [self count];
    
    for (NSUInteger position = 0; position < count; position += step) {
        NSUInteger maxLength = position + items < count ? items : count - position;
        NSRange range = NSMakeRange(position, maxLength);
        NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:range];
        
        id objects = [self objectsAtIndexes:set];
        
        if (objects) {
            [partition addObject:objects];
        }
    }
    
    return [NSArray arrayWithArray:partition];
}

@end
