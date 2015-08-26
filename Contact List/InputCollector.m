//
//  InputCollector.m
//  Contact List
//
//  Created by Steve on 2015-08-25.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.inputArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSString *)inputForPrompt:(NSString *)promptString {
    // print promptString
    char inputString[255];
    
    // get string input from user
    // convert to NSString
    // trim newlines maybe???
    NSLog(@"%@", promptString);
    
    fgets(inputString, 255, stdin);
    
    NSString *userInput = [NSString stringWithUTF8String:inputString];
    
    userInput = [userInput stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    // return user input.
    
    return userInput;
}


@end
