//
//  Todos.m
//  TodoTableView
//
//  Created by Sutee Sudprasert on 28/4/2013.
//  Copyright (c) 2013 Sutee Sudprasert. All rights reserved.
//

#import "Todos.h"

@interface Todos()

@property (nonatomic, strong) NSMutableArray *todos;

@end

@implementation Todos

@synthesize todos = _todos;

- (NSMutableArray *)todos
{
    if (!_todos) {
        _todos = [[NSMutableArray alloc] init];
    }
    return _todos;
}

- (void)add:(Todo *)todo;
{
    [self.todos addObject:todo];
}

- (void)clear
{
    [self.todos removeAllObjects];
}

- (void)removeAtPosition:(NSUInteger)position
{
    [self.todos removeObjectAtIndex:position];
}


@end
