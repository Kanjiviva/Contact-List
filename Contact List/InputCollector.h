//
//  InputCollector.h
//  Contact List
//
//  Created by Steve on 2015-08-25.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputCollector : NSObject

@property (strong, nonatomic) NSMutableArray *inputArray;

- (NSString *)inputForPrompt:(NSString *)promptString;


@end
