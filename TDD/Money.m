//
//  Money.m
//  TDD
//
//  Created by SangChan on 2014. 9. 4..
//  Copyright (c) 2014년 sangchan. All rights reserved.
//

#import "Money.h"
#import "Sum.h"
#import "Bank.h"

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
+ (Money *)dollar:(int)amount
{
    return [[Money alloc] initWithAmount:amount currency:@"USD"];
}
+ (Money *)franc:(int)amount;
{
    return [[Money alloc] initWithAmount:amount currency:@"CHF"];
}

- (id<ExpressionProtocol>)times:(int)multiplier
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

- (id<ExpressionProtocol>)plus:(id<ExpressionProtocol>)addend
{
    return [[Sum alloc] initWithAugend:self addend:addend];
}


- (Money *)reduceWithBank:(Bank *)bank to:(NSString *)to
{
    int rate = [bank rateFrom:_currency to:to];
    return [[Money alloc] initWithAmount:(_amount/rate) currency:to];
}

@end
