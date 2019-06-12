// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>
#import <People/People.h>

@interface PersonTests : XCTestCase
@end

@implementation PersonTests

- (void)testMyPerson {
    
    Person *person = [[Person alloc] init];
    
    NSLog(@"My person is %@", person);
}

- (void)testSomethingElse {
    
}

@end
