// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>

//#import <Persons/Persons.h>
#import "Person.h"


@interface PersonsTests : XCTestCase
@end

@implementation PersonsTests

- (void)testClassClusters {
    NSString *s1 = [NSString alloc];
    NSString *s2 = [NSString alloc];
    
    s1 = [s1 initWithFormat:@"%@ %@", @"Hello", @"World!"];
    s2 = [s2 initWithString:@"Woohoo!"];
    
    NSLog(@"%@", s1);
    NSLog(@"%@", s2);
    
    NSArray *a1 = [NSArray alloc];
    a1 = [a1 initWithObjects:s1, s2, nil];
    NSMutableArray *a2 = [[NSMutableArray alloc] initWithArray:a1];
    
    
    NSLog(@"%@", a1);
    NSLog(@"%@", a2);
}

- (void)testCopying {
    Person *person = [[Person alloc] initWithFirstName:@"Fred" lastName:@"Smith"];
    NSLog(@"My person is %@", person);
    
//    SEL mySelector = NSSelectorFromString(@"copyWithZone:");
//
//    id foo = [person performSelector:mySelector];
    id foobar = @42;
    [foobar copyWithZone:nil];
    
    Person *clonedPerson = [person copy];
    NSLog(@"Cloned person is %@", clonedPerson);
}

- (void)testDataTypes {
    Person *person = @"Fred";
    NSLog(@"%@", person);
    
    NSArray<Person *> *peeps = @[[[Person alloc] init]];
    
    for (Person *p in peeps) {
        NSLog(@"%@", p);
    }
}

- (void)xxxtestUnrecognizedSelector {
    id person = [[Person alloc] init];
    [person alloc];
    [person floatValue];
}

- (void)testMyPerson {
    
    Person *person = [[Person alloc] init];
    
    NSLog(@"My person is %@", person);
}

- (void)testFirstName {
    Person *person = [[Person alloc] init];
    [person setFirstName:@"Fred"];
    XCTAssertEqualObjects([person firstName], @"Fred");
}

- (void)testFullName {
    Person *person = [[Person alloc] initWithFirstName:@"Fred"
                                              lastName:@"Smith"];
    XCTAssertEqualObjects([person fullName], @"Fred Smith");
}

@end
