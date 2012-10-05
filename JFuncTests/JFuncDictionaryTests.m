//
//  JFuncDictionaryTests.m
//  JFunc
//
//  Created by Julien Fantin on 05/10/12.
//  Copyright (c) 2012 Julien Fantin. All rights reserved.
//

#import "JFuncDictionaryTests.h"

@implementation JFuncDictionaryTests

#pragma - array

- (void)testToArray
{
    NSDictionary *test = @{@"a": @1, @"b": @2};
    NSArray *expected = @[@[@"a", @1], @[@"b", @2]];
    NSArray *result = [test toArray];
    
    STAssertTrue([result isEqualToArray:expected],
                 @"Should map key/values to an array of arrays where each leaf is @[key, obj]");
}

#pragma - map

- (void)testMap
{
    NSDictionary *test = @{@"a": @1, @"b": @2};
    NSDictionary *expected = @{@1: @"a", @2: @"b"};
    
    NSDictionary *result = [test mapWithBlock:^NSDictionary *(id key, id obj) {
        return @{obj: key};
    }];
    
    STAssertTrue([result isEqualToDictionary:expected], @"");
}
@end
