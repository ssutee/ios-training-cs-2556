//
//  Todo+Helper.h
//  TodoTableView
//
//  Created by Sutee Sudprasert on 28/4/2013.
//  Copyright (c) 2013 Sutee Sudprasert. All rights reserved.
//

#import "Todo.h"

@interface Todo (Helper)

+ (Todo *)todoWithName:(NSString *)name inContext:(NSManagedObjectContext *)context;

+ (void)clearTodosInContext:(NSManagedObjectContext *)context;

@end
