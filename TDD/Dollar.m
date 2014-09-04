//
//  Dollar.m
//  TDD
//
//  Created by SangChan on 2014. 9. 3..
//  Copyright (c) 2014년 sangchan. All rights reserved.
//

#import "Dollar.h"

@interface Dollar ()

@end
@implementation Dollar

- (id)initWithAmount:(int) thisAmount
{
    if (self = [super init]) {
        self.amount = thisAmount;
    }
    return self;
}
- (Money *)times:(int)multiplier
{
    return [[Dollar alloc]initWithAmount:self.amount * multiplier];
}

@end