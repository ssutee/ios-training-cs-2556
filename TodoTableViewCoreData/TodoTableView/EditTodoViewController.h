//
//  EditTodoViewController.h
//  TodoTableView
//
//  Created by Sutee Sudprasert on 28/4/2013.
//  Copyright (c) 2013 Sutee Sudprasert. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EditTodoViewController;

@protocol EditTodoViewControllerDelegate <NSObject>

- (void)editTodoViewControler:(EditTodoViewController *)controller didSaveWithName:(NSString *)name;

@end

@interface EditTodoViewController : UIViewController

@property (nonatomic, strong) NSString *todoName;
@property (weak, nonatomic) IBOutlet UITextField *todoNameText;
@property (nonatomic, weak) id<EditTodoViewControllerDelegate> delegate;

@end
