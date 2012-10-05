//
//  JFuncArray.m
//  JFunc
//
//  Created by Julien Fantin on 05/10/12.
//  Copyright (c) 2012 Julien Fantin. All rights reserved.
//

#import "JFuncArrayTests.h"

@implementation JFuncArrayTests

#pragma - range

- (void)testRange
{
    int location = 10, length = 10;
    NSArray *range = [NSArray arrayWithRange:NSMakeRange(location, length)];
    STAssertEquals([range count], (NSUInteger)length,
                   @"Should have proper lentgth.");
    STAssertEqualObjects([range objectAtIndex:0], @10,
                         @"First object should be an NSNumber of the first value in range.");
    STAssertEqualObjects([range lastObject], @19,
                         @"Last object should be an NSNumber of the last value in range.");
}

#pragma - map

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

#pragma - reduce

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
    
    STAssertTrue([result isEqualToArray:expected], @"Should reassign the accumulator to the object returned by the block.");
}

#pragma - filter

- (void)testFilter
{
    NSArray *test= @[@1, @2, @3, @4, @5];
    NSArray *expected = @[@1, @3, @5];
    
    NSArray *result = [test filteredArrayUsingBlock:^(int index, id obj) {
        BOOL even = ([obj intValue] % 2) == 0;
        return even ? nil : obj;
    }];
    
    STAssertTrue([result isEqualToArray:expected], @"Should filter out even numbers.");
}

@end
