//
//  Dollar.m
//  TDD
//
//  Created by SangChan on 2014. 9. 3..
//  Copyright (c) 2014년 sangchan. All rights reserved.
//

#import "Dollar.h"

@implementation Dollar

- (id)initWithAmount:(int) thisAmount
{
    if (self = [super init]) {
        self.amount = thisAmount;
    }
    return self;
}
- (void)times:(int)multiplier
{
    self.amount *= multiplier;
}

@end
