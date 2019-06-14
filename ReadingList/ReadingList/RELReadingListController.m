// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RELReadingListController.h"

@implementation RELReadingListController

- (IBAction)done:(UIStoryboardSegue *)unwindSegue {
    // TODO: sync UI and save model
}

- (IBAction)cancel:(UIStoryboardSegue *)unwindSegue { }

@end


@implementation RELReadingListController (DataSource)

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Book"];
    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
//                                      reuseIdentifier:@"Book"];
////        cell.textLabel.text = [NSString stringWithFormat:@"Row %@", @(indexPath.row + 1)];
//    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Row %@", @(indexPath.row + 1)];
    
    return cell;
}

@end
