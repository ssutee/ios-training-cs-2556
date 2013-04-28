//
//  EditTodoViewController.m
//  TodoTableView
//
//  Created by Sutee Sudprasert on 28/4/2013.
//  Copyright (c) 2013 Sutee Sudprasert. All rights reserved.
//

#import "EditTodoViewController.h"

@interface EditTodoViewController ()

@end

@implementation EditTodoViewController

@synthesize todoName = _todoName;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.todoNameText.text = self.todoName;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)save:(id)sender {
    [self.delegate editTodoViewControler:self didSaveWithName:self.todoNameText.text];
}

@end
