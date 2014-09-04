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
    return _amount == money.amount && [_currency isEqualToString:[money currency]];
}
+ (Dollar *)dollar:(int)amount
{
    return [[Dollar alloc] initWithAmount:amount currency:@"USD"];
}
+ (Franc *)franc:(int)amount;
{
    return [[Franc alloc] initWithAmount:amount currency:@"CHF"];
}

-(Money *)times:(int)multiplier
{
    return [[Money alloc] initWithAmount:_amount*multiplier currency:_currency];
}

- (NSString *)currency
{
    return _currency;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"amount = %d , currecy = %@",_amount, _currency];
}

@end
