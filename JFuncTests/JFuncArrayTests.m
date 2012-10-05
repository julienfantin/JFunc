//
//  JFuncArray.m
//  JFunc
//
//  Created by Julien Fantin on 05/10/12.
//  Copyright (c) 2012 Julien Fantin. All rights reserved.
//

#import "JFuncArrayTests.h"

@implementation JFuncArrayTests

- (void)testMapShouldRunABlockWithEachElementAndReturnANewArray
{
    NSArray *test = @[@1, @2, @3];
    NSArray *expected = @[@2, @3, @4];
    NSArray *result = [test mapWithBlock:^(id obj) {
        int result = [obj intValue] + 1;
        return @(result);
    }];
    
    STAssertFalse([test isEqual:result], @"a and b should be different arrays.");
    STAssertTrue([result isEqualToArray:expected], @"b should be the result of mapping block over each element");
}

@end
