// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "UIStoryboardSegue+RELAdditions.h"

@implementation UIStoryboardSegue (RELAdditions)

- (UIViewController *)rel_destinationViewController {
    if (![self.destinationViewController isKindOfClass:UINavigationController.class]) {
        return self.destinationViewController;
    }
    UINavigationController *navController = self.destinationViewController;
    return navController.childViewControllers.firstObject;
}

@end
