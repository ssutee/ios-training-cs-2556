//
//  Todo.h
//  TodoTableView
//
//  Created by Sutee Sudprasert on 28/4/2013.
//  Copyright (c) 2013 Sutee Sudprasert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSDate *date;

- (id)initWithName:(NSString *)name;

@end
