//
//  Money.m
//  TDD
//
//  Created by SangChan on 2014. 9. 4..
//  Copyright (c) 2014년 sangchan. All rights reserved.
//

#import "Money.h"

@implementation Money

@synthesize amount = _amount;

- (BOOL)equals:(id)object
{
    Money *money = (Money *)object;
    return _amount == money.amount && [[self class] isEqual:[money class]];
}
@end
