//
//  Money.m
//  TDD
//
//  Created by SangChan on 2014. 9. 4..
//  Copyright (c) 2014년 sangchan. All rights reserved.
//

#import "Money.h"
#import "Dollar.h"
#import "Franc.h"

@implementation Money

@synthesize amount = _amount;

- (BOOL)equals:(id)object
{
    Money *money = (Money *)object;
    return _amount == money.amount && [[self class] isEqual:[money class]];
}
+ (Dollar *)dollar:(int)amount
{
    return [[Dollar alloc] initWithAmount:amount];
}
+ (Franc *)franc:(int)amount;
{
    return [[Franc alloc] initWithAmount:amount];
}

-(id)times:(int)multiplier
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

@end
