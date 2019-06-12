// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "Person.h"

@implementation Person

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName {
    
    if (!(self = [super init])) return nil;
    
    _firstName = [firstName copy];
    _lastName = [lastName copy];
    
    return self;
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", self.fullName];
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone { 
    Person *newPerson = [[Person allocWithZone:zone] init];
    newPerson.firstName = self.firstName;
    newPerson.lastName = self.lastName;
//    [newPerson setFirstName:[self firstName]];
//    [newPerson setLastName:[self lastName]];
    return newPerson;
}

@end
