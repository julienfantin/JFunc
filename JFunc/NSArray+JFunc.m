//
//  NSArray+JFunc.m
//  JFunc
//
//  Created by Julien Fantin on 05/10/12.
//  Copyright (c) 2012 Julien Fantin. All rights reserved.
//

#import "NSArray+JFunc.h"

@implementation NSArray (JFunc)

- (NSArray *)mapWithBlock:(JFuncMappingBlock)block
{
    NSMutableArray *map = [NSMutableArray arrayWithCapacity:[self count]];

    for (id obj in self) {
        [map addObject:block(obj)];
    }
    
    return [NSArray arrayWithArray:map];
}

@end
