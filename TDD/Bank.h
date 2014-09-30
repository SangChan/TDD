//
//  Bank.h
//  TDD
//
//  Created by SangChan on 2014. 9. 4..
//  Copyright (c) 2014년 sangchan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Money;

@interface Bank : NSObject
- (Money *) reduce:(id)source to:(NSString *)to;
@end