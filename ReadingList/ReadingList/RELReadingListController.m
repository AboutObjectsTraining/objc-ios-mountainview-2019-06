// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RELReadingListController.h"
#import "RELViewBookController.h"
#import "RELAddBookController.h"
#import "RELDataSource.h"
#import "UIStoryboardSegue+RELAdditions.h"

@interface RELReadingListController ()
@property (strong, nonatomic) IBOutlet RELDataSource *dataSource;
@end

@implementation RELReadingListController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"View"]) {
        RELViewBookController *controller = segue.rel_destinationViewController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        controller.book = [self.dataSource bookAtIndexPath:indexPath];
    } else if ([segue.identifier isEqualToString:@"Add"]) {
        RELAddBookController *controller = segue.rel_destinationViewController;
        typeof(self) __weak weakSelf = self;
        controller.completion = ^(RLMBook *book) {
            typeof(weakSelf) __strong strongSelf = weakSelf;
            [strongSelf insertBook:book];
        };
    }
}

- (void)insertBook:(RLMBook *)book {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.dataSource insertBook:book atIndexPath:indexPath];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

// MARK: Unwind segues

- (IBAction)done:(UIStoryboardSegue *)unwindSegue {
    [self.tableView reloadData];
    [self.dataSource save];
}

- (IBAction)cancel:(UIStoryboardSegue *)unwindSegue { }

@end


//@implementation RELReadingListController (DataSource)
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 100;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Book"];
//
////    if (cell == nil) {
////        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
////                                      reuseIdentifier:@"Book"];
//////        cell.textLabel.text = [NSString stringWithFormat:@"Row %@", @(indexPath.row + 1)];
////    }
//
//    cell.textLabel.text = [NSString stringWithFormat:@"Row %@", @(indexPath.row + 1)];
//
//    return cell;
//}
//
//@end
