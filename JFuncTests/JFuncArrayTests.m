//
//  JFuncArray.m
//  JFunc
//
//  Created by Julien Fantin on 05/10/12.
//  Copyright (c) 2012 Julien Fantin. All rights reserved.
//

#import "JFuncArrayTests.h"

@implementation JFuncArrayTests

- (void)testMapWithBlock
{
    NSArray *test = @[@1, @2, @3];
    NSArray *expected = @[@2, @3, @4];

    NSArray *result = [test mapWithBlock:^(id obj) {
        int result = [obj intValue] + 1;
        return @(result);
    }];
    
    STAssertFalse([test isEqual:result], @"should be free of side-effects by returning a new array.");
    STAssertTrue([result isEqualToArray:expected], @"should be the result of mapping block over each element");
}

- (void)testReduceAccumulator
{
    NSArray *test = @[@1, @2, @3];
    NSNumber *expected = @7;
    NSNumber *accumulator = @1;
   
    id result = [test reduce:accumulator withBlock:^(id acc, id obj) {
        return @((NSInteger)([acc intValue] + [obj intValue]));
    }];
    
    STAssertEquals(result, expected, @"Should ");
}

- (void)testReduceAccumulatorAdd
{
    NSArray *test = @[@1, @2, @3];
    NSArray *expected = @[@1, @3, @6];
    
    id result = [test reduce:[NSMutableArray array] withBlock:(id)^(id accumulator, id obj) {
        NSNumber *last = [(NSArray *)accumulator lastObject];
        NSNumber *value = @((NSInteger)([last intValue] + [obj intValue]));
        return [accumulator arrayByAddingObject:value]; // Could also add to accumulator and return it
    }];
    
    STAssertTrue([result isEqualToArray:expected], @"Should ");
}

@end
