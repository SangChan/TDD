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


- (id)initWithAmount:(int)thisAmount currency:(NSString *)currency
{
    if (self = [super init]) {
        _amount = thisAmount;
        _currency = currency;
    }
    return self;
}

- (BOOL)equals:(id)object
{
    Money *money = (Money *)object;
    return _amount == money.amount && [[self class] isEqual:[money class]];
}
+ (Dollar *)dollar:(int)amount
{
    return [[Dollar alloc] initWithAmount:amount currency:@"USD"];
}
+ (Franc *)franc:(int)amount;
{
    return [[Franc alloc] initWithAmount:amount currency:@"CHF"];
}

-(id)times:(int)multiplier
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

- (NSString *)currency
{
    return _currency;
}

@end
