//
//  NSArray+JFunc.h
//  JFunc
//
//  Created by Julien Fantin on 05/10/12.
//  Copyright (c) 2012 Julien Fantin. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^JFuncVoidBlock) (id obj);
typedef id (^JFuncMappingBlock) (id obj);
typedef id (^JFuncEnumeratedMappingBlock) (int index, id obj);
typedef id (^JFuncReducingBlock) (id accumulator, id obj);

@interface NSArray (JFunc)
+ (NSArray *)arrayWithRange:(NSRange)range;
- (NSArray *)mapWithBlock:(JFuncMappingBlock)block;
- (id)reduce:(id)acumulator withBlock:(JFuncReducingBlock)block;
- (NSArray *)filteredArrayUsingBlock:(JFuncEnumeratedMappingBlock)block;
- (NSArray *)partitionWithStep:(NSUInteger)step;
- (NSArray *)partitionWithItems:(NSUInteger)items andStep:(NSUInteger)step;
@end
