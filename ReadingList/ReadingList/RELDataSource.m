// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RELDataSource.h"
#import "RLMReadingList.h"
#import "RLMBook.h"
#import "RLMAuthor.h"
#import "RLMStoreController.h"
#import <UIKit/UIKit.h>

@interface RELDataSource () <UITableViewDataSource>
@property (strong, nonatomic) IBOutlet RLMStoreController *storeController;
@property (copy, nonatomic) RLMReadingList *readingList;
@end

@implementation RELDataSource

- (RLMBook *)bookAtIndexPath:(NSIndexPath *)indexPath {
    return [self.readingList bookAtIndexPath:indexPath];
}

- (void)insertBook:(RLMBook *)book atIndexPath:(NSIndexPath *)indexPath {
    [self.readingList insertBook:book atIndexPath:indexPath];
}

- (RLMReadingList *)readingList {
    if (_readingList == nil) {
        _readingList = self.storeController.fetchedReadingList;
    }
    return _readingList;
}

- (void)save {
    [self.storeController saveReadingList:self.readingList];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.readingList.books.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Book"];
    [self populateCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)populateCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    RLMBook *book = [self bookAtIndexPath:indexPath];
    cell.textLabel.text = book.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@", book.year, book.author.fullName];
}

@end
