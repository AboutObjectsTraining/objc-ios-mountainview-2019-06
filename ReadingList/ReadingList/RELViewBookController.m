// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RELViewBookController.h"
#import "RELEditBookController.h"
#import "RLMBook.h"
#import "RLMAuthor.h"
#import "UIStoryboardSegue+RELAdditions.h"

@interface RELViewBookController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;

@end


@implementation RELViewBookController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.titleLabel.text = self.book.title;
    self.yearLabel.text = self.book.year;
    self.firstNameLabel.text = self.book.author.firstName;
    self.lastNameLabel.text = self.book.author.lastName;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    RELEditBookController *controller = segue.rel_destinationViewController;
    controller.book = self.book;
}


// MARK: - Unwind segues
- (IBAction)cancel:(UIStoryboardSegue *)unwindSegue { }


@end

