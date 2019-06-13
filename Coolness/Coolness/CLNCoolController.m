// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolController.h"
#import "CLNCoolViewCell.h"

@interface CLNCoolController () <UITextFieldDelegate>

@property (weak, nonatomic) UITextField *textField;
@property (weak, nonatomic) UIView *contentView;

@end

@implementation CLNCoolController

- (void)addCell {
    NSLog(@"In %s, text is %@", __func__, self.textField.text);
    CLNCoolViewCell *newCell = [[CLNCoolViewCell alloc] init];
    newCell.text = self.textField.text;
    [self.contentView addSubview:newCell];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)loadView {
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = UIColor.brownColor;
    
    CGRect screenRect = UIScreen.mainScreen.bounds;
    CGRect accessoryRect;
    CGRect contentRect;
    CGRectDivide(screenRect, &accessoryRect, &contentRect, 100, CGRectMinYEdge);
    
    UIView *accessoryView = [[UIView alloc] initWithFrame:accessoryRect];
    UIView *contentView = [[UIView alloc] initWithFrame:contentRect];
    
    self.contentView = contentView;
    
    [self.view addSubview:accessoryView];
    [self.view addSubview:contentView];
    
    accessoryView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.7];
    contentView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    
    contentView.clipsToBounds = YES;
    
    // Controls
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(16, 62, 260, 30)];
    self.textField = textField;
    [accessoryView addSubview:textField];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Enter a label";
    
    textField.delegate = self;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [accessoryView addSubview:button];
    [button setTitle:@"Add" forState:UIControlStateNormal];
    [button sizeToFit];
    button.frame = CGRectOffset(button.frame, 290, 60);
    
    [button addTarget:self action:@selector(addCell) forControlEvents:UIControlEventTouchUpInside];
    
    // Cells
    
    CLNCoolViewCell *subview1 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(20, 80, 160, 40)];
    CLNCoolViewCell *subview2 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(40, 150, 160, 40)];
    [contentView addSubview:subview1];
    [contentView addSubview:subview2];
    
    subview1.text = @"Cool View Cells rock! 🎉🍾";
    subview2.text = @"Hello World! 🌏🌎";
    
    subview1.backgroundColor = UIColor.purpleColor;
    subview2.backgroundColor = UIColor.orangeColor;
}

@end
