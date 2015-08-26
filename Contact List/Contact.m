//
//  Contact.m
//  Contact List
//
//  Created by Steve on 2015-08-25.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import "Contact.h"

@implementation Contact


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.phoneNumber = [[NSMutableArray alloc] init];
    }
    return self;
}
@end
