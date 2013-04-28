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
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TodoAddedNotification" object:todo];
}

- (void)clear
{
    [self.todos removeAllObjects];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TodoClearedNotification" object:self];
}

- (void)removeAtPosition:(NSUInteger)position
{
    [self.todos removeObjectAtIndex:position];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TodoRemovedNotification" object:[NSNumber numberWithUnsignedInteger:position]];
}

- (NSInteger)count
{
    return self.todos.count;
}

- (Todo *)todoAtPosition:(NSUInteger)position
{
    return [self.todos objectAtIndex:position];
}
@end
