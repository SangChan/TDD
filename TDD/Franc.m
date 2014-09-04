//
//  Franc.m
//  TDD
//
//  Created by SangChan on 2014. 9. 4..
//  Copyright (c) 2014년 sangchan. All rights reserved.
//

#import "Franc.h"

@interface Franc ()

@end
@implementation Franc

- (id)initWithAmount:(int) thisAmount
{
    if (self = [super init]) {
        self.amount = thisAmount;
    }
    return self;
}
- (Franc *)times:(int)multiplier
{
    return [[Franc alloc]initWithAmount:self.amount * multiplier];
}


@end
