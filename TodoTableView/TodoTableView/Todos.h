//
//  Todos.h
//  TodoTableView
//
//  Created by Sutee Sudprasert on 28/4/2013.
//  Copyright (c) 2013 Sutee Sudprasert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Todo.h"

@interface Todos : NSObject

- (void)add:(Todo *)todo;
- (void)clear;
- (void)removeAtPosition:(NSUInteger)position;

@end
