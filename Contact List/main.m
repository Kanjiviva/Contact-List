//
//  main.m
//  Contact List
//
//  Created by Steve on 2015-08-25.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"
#import "ContactList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        InputCollector *inputCollector = [[InputCollector alloc] init];
        
        ContactList *contactList = [[ContactList alloc] init];
        
        NSArray *commandArray = @[@"quit", @"new", @"list", @"show", @"find", @"history"];
        
        BOOL running = YES;
        BOOL phoneAsking = YES;
        
        while (running) {
            NSString *command = [inputCollector inputForPrompt:[NSString stringWithFormat:@"Enter a command (%@): ", commandArray]];
            
            [inputCollector.inputArray addObject:command];
            
//            for (int i = 0; i < [inputCollector.inputArray count]; i++) {
//                if ([inputCollector.inputArray count] > 3) {
//                    [inputCollector.inputArray removeObjectAtIndex:0];
//                    [inputCollector.inputArray insertObject:command atIndex:2];
//                }
//            }
            
            if ([command isEqualToString:@"quit"]) {
            
                running = NO;
            
                
                
            } else if ([command isEqualToString:@"new"]) {
                
                Contact *contact = [[Contact alloc] init];
                
                contact.fullName = [inputCollector inputForPrompt:@"Please Enter your full name: "];
                contact.email = [inputCollector inputForPrompt:@"Please Enter your email address: "];
                
                
                while (phoneAsking) {
                    
                    NSString *phones = [inputCollector inputForPrompt:@"Please Enter your phone number (Type quit if you done modify): "];
                    
                    
                    if (![phones isEqualToString:@"quit"]) {
                        
                        [contact.phoneNumber addObject:phones];
                    }else {
                        phoneAsking = NO;
                    }
                    
                    
                }
                
                if ([contactList findDuplicate:contact.fullName email:contact.email]) {
                    NSLog(@"There are existing name or email");
                }else {
                    [contactList addContact:contact];
                }

                
            } else if ([command isEqualToString:@"list"]) {
                
                [contactList listAllContacts];
                
                
                
            } else if ([command isEqualToString:@"show"]) {
                
                NSInteger index = [[inputCollector inputForPrompt:@"Please enter a number "] integerValue];
                
                if (index < [contactList.list count] && index >= 0) {
                    Contact *contact = [contactList showIndexContact:index];
                    
                    NSLog(@"%@ %@ %@", contact.fullName, contact.email, contact.phoneNumber);
                    
                } else {
                    
                    NSLog(@"Index ID not found");
                    
                }
                
                
            } else if ([command isEqualToString:@"find"]) {
                
                NSString *thisString = [inputCollector inputForPrompt:@"Please search any name/email"];
                
                Contact *contact = [contactList findMatchStrings:thisString];
                
                if (contact != nil) {
                    NSLog(@"%@ %@ %@", contact.fullName, contact.email, contact.phoneNumber);
                } else {
                    NSLog(@"No matches");
                }

                
            } else if ([command isEqualToString:@"history"]) {
                
                NSLog(@"%@", inputCollector.inputArray);
                
            }
            
        }
        
        
        

        
    }
    return 0;
}
