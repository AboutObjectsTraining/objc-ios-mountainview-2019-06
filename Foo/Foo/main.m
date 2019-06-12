// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <Foundation/Foundation.h>

void foo(int);


struct Person {
    char *firstName;
    char *lastName;
    int age;
};
typedef struct Person Person;


static void PlayWithPointersToChar() {
    char a[] = "Foo";
    //    char *b = "Foo";
    char *c = "Foo";
    
    a[0] = 'B';
    printf("%s\n", a);
    c[0] = 'B';
    printf("%s\n", c);
}

void PlayWithStructs() {
    Person fred = {
        .age = 23,
        .firstName = "Fred"
    };
    
    printf("%p\n", &fred);
}

int main(int argc, const char * argv[]) {
    
    PlayWithStructs();
//    PlayWithPointersToChar();
    
    return 0;
}
