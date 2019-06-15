// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class RLMBook;

@interface RELAddBookController : UITableViewController

@property (strong, nonatomic) void (^completion)(RLMBook *book);

@end

NS_ASSUME_NONNULL_END
