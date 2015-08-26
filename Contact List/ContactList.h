//
//  ContactList.h
//  Contact List
//
//  Created by Steve on 2015-08-25.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface ContactList : NSObject

@property (strong, nonatomic) NSMutableArray *list;

//-(void)listAllContact;
//-(Contact *)findContactWithName:(NSString *)name;
- (void)addContact:(Contact *)newContact;
- (void)listAllContacts;
- (Contact *)showIndexContact:(NSInteger)userInputId;
- (Contact *)findMatchStrings:(NSString *)userInputString;
- (BOOL)findDuplicate:(NSString *)name email:(NSString *)email;

@end
