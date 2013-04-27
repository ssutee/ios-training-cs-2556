//
//  ViewController.m
//  BasicTodo
//
//  Created by Sutee Sudprasert on 27/4/2013.
//  Copyright (c) 2013 Sutee Sudprasert. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *todos;

@end

@implementation ViewController

@synthesize todos = _todos;

- (NSMutableArray *)todos
{
    if (!_todos) {
        _todos = [[NSMutableArray alloc] init];
    }
    return _todos;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (IBAction)hideKeyboard:(id)sender {
    [self.inputText resignFirstResponder];
    [self.todoTextView resignFirstResponder];
}

- (IBAction)add:(id)sender {
    NSString *todo = self.inputText.text;
    if (todo.length) {
        [self.todos addObject:todo];
        [self update];
    }
    self.inputText.text = @"";
    [self.inputText resignFirstResponder];
}

- (IBAction)clear:(id)sender {
    [self.todos removeAllObjects];
    [self update];
}

- (void)update
{
    self.todoTextView.text = @"";
    int count = 0;
    for (NSString *todo in self.todos) {
        self.todoTextView.text = [self.todoTextView.text stringByAppendingFormat:@"%d: %@\n", ++count, todo];
    }
}



@end
