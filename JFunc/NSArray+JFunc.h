//
//  NSArray+JFunc.h
//  JFunc
//
//  Created by Julien Fantin on 05/10/12.
//  Copyright (c) 2012 Julien Fantin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id (^JFuncMappingBlock) (id obj);

@interface NSArray (JFunc)
- (NSArray *)mapWithBlock:(JFuncMappingBlock)block;
@end
