// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <Foundation/Foundation.h>

@class RLMBook;

NS_ASSUME_NONNULL_BEGIN

@interface RELDataSource : NSObject

- (RLMBook *)bookAtIndexPath:(NSIndexPath *)indexPath;
- (void)insertBook:(RLMBook *)book atIndexPath:(NSIndexPath *)indexPath;
- (void)save;

@end

NS_ASSUME_NONNULL_END
