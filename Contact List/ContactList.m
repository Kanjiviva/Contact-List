//
//  ContactList.m
//  Contact List
//
//  Created by Steve on 2015-08-25.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import "ContactList.h"

@implementation ContactList


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.list = [[NSMutableArray alloc] init];
        
    }
    return self;
}



- (void)addContact:(Contact *)newContact {

    [self.list addObject:newContact];
    
}

- (void)listAllContacts {

    for (int i = 0; i < [self.list count]; i ++) {
        if ([self.list count] == 0) {
            NSLog(@"No lists available");
        }
        
        Contact *contact = [self.list objectAtIndex:i];
        
        
        NSLog(@"%i, %@, %@ Mobile: %@", i, contact.fullName, contact.email, contact.phoneNumber);
    
    }
}

- (Contact *)showIndexContact:(NSInteger)userInputId {
    Contact *contact = [self.list objectAtIndex:userInputId];
    
    return contact;
}

- (Contact *)findMatchStrings:(NSString *)userInputString {
    
    for (int i = 0; i < [self.list count]; i++) {
        Contact *contact = [self.list objectAtIndex:i];
        
        if ([contact.fullName containsString:userInputString] || [contact.email containsString:userInputString]) {
            return contact;

        }

    }
    
    return nil;
}

- (BOOL)findDuplicate:(NSString *)name email:(NSString *)email {
    for (int i = 0; i < [self.list count]; i ++) {
        Contact *contact = [self.list objectAtIndex:i];
        
        if ([contact.fullName isEqualToString:name] || [contact.email isEqualToString:email]) {
            return YES;
        }
        
    }
    
    return NO;
}


@end
