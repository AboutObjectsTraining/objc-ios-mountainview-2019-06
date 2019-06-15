// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RELAddBookController.h"
#import "RLMBook.h"
#import "RLMAuthor.h"

@interface RELAddBookController ()
@property (readonly, nonatomic) RLMBook *book;

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *yearField;
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;

@end

@implementation RELAddBookController

- (RLMBook *)book {
    NSDictionary *bookInfo = @{ RLMBookKeys.title : self.titleField.text,
                                RLMBookKeys.year : self.yearField.text,
                                RLMBookKeys.author : @{
                                        RLMAuthorKeys.firstName : self.firstNameField.text,
                                        RLMAuthorKeys.lastName : self.lastNameField.text
                                        }
                                };
    return [RLMBook modelObjectWithDictionary:bookInfo];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Done"]) {
        self.completion(self.book);
    }
}

@end
