//
//  Todo.m
//  TodoTableView
//
//  Created by Sutee Sudprasert on 28/4/2013.
//  Copyright (c) 2013 Sutee Sudprasert. All rights reserved.
//

#import "Todo.h"

@implementation Todo

@synthesize name = _name;
@synthesize date = _date;

- (id)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        self.name = name;
        self.date = [NSDate date];
    }
    return self;
}

@end
