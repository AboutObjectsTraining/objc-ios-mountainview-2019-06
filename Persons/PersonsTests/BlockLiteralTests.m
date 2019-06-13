// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>

@interface BlockLiteralTests: XCTestCase
@property (copy, nonatomic) NSString *bar;
@property (copy, nonatomic) void (^myBlock)(void);
@end

void sayHello(void) {
    printf("Hello!\n");
}

@implementation BlockLiteralTests

- (void)testFunctionPointer {
    
    void (*myFunctionPointer)(void);
    myFunctionPointer = sayHello;
    sayHello();
    myFunctionPointer();
}

- (void)testBlockLiteral {
    NSString *foo = @"World!";
    _bar = @"Whopee!";
    void (^myBlockLiteral)(void);
    myBlockLiteral = ^{
        printf("Hello %s!\n", foo.UTF8String);
        NSLog(@"%@", self.bar);
    };
    
    //    void (^copyOfMyBlockLiteral)(void) = [myBlockLiteral copy];
    //    copyOfMyBlockLiteral();
    
    self.myBlock = myBlockLiteral;
    [self runMyBlock:myBlockLiteral];    
}

- (void)runMyBlock:(void (^)(void))literal {
    literal();
    self.myBlock();
}


@end
