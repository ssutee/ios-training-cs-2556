//
//  Todo+Helper.m
//  TodoTableView
//
//  Created by Sutee Sudprasert on 28/4/2013.
//  Copyright (c) 2013 Sutee Sudprasert. All rights reserved.
//

#import "Todo+Helper.h"

@implementation Todo (Helper)

+ (Todo *)todoWithName:(NSString *)name inContext:(NSManagedObjectContext *)context
{
    Todo *todo = [NSEntityDescription insertNewObjectForEntityForName:@"Todo" inManagedObjectContext:context];
    todo.name = name;
    return todo;
}

+ (void)clearTodosInContext:(NSManagedObjectContext *)context
{
    [context deletedObjects];
}

@end
