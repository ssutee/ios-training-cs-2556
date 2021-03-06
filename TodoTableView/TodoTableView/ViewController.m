//
//  ViewController.m
//  TodoTableView
//
//  Created by Sutee Sudprasert on 28/4/2013.
//  Copyright (c) 2013 Sutee Sudprasert. All rights reserved.
//

#import "ViewController.h"
#import "Todos.h"
#import "Todo.h"
#import "EditTodoViewController.h"

@interface ViewController ()<EditTodoViewControllerDelegate>

@property (nonatomic, strong) Todos *todos;

@end

@implementation ViewController

@synthesize todos = _todos;

- (Todos *)todos
{
    if (!_todos) {
        _todos = [[Todos alloc] init];
    }
    return _todos;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateViews:) name:@"TodoAddedNotification" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateViews:) name:@"TodoClearedNotification" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateViews:) name:@"TodoRemovedNotification" object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)updateViews:(NSNotification *) notification
{
    if ([notification.name isEqualToString:@"TodoAddedNotification"] || [notification.name isEqualToString:@"TodoClearedNotification"] || [notification.name isEqualToString:@"TodoRemovedNotification"] ) {
        NSLog(@"%@", notification.name);
        [self.tableView reloadData];
    }
}

- (IBAction)add:(id)sender
{
    if (self.inputText.text.length) {
        [self.todos add:[[Todo alloc] initWithName:self.inputText.text]];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Todo Cell"];
    Todo *todo = [self.todos todoAtPosition:indexPath.row];
    cell.textLabel.text = todo.name;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.todos.count;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // delete model here
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"Edit Todo" sender:indexPath];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Edit Todo"]) {
        NSIndexPath *indexPath = sender;
        EditTodoViewController *controller = segue.destinationViewController;
        controller.todoName = [self.todos todoAtPosition:indexPath.row].name;
        controller.delegate = self;
    }
}

- (void)editTodoViewControler:(EditTodoViewController *)controller didSaveWithName:(NSString *)name
{
    NSLog(@"%@", name);
    [self.navigationController popViewControllerAnimated:YES];
}

@end
