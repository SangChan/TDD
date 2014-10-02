//
//  Bank.m
//  TDD
//
//  Created by SangChan on 2014. 9. 4..
//  Copyright (c) 2014년 sangchan. All rights reserved.
//

#import "Bank.h"
#import "Money.h"
#import "Sum.h"
#import "ExpressionProtocol.h"
#import "Pair.h"

@interface Bank () {
    NSMutableDictionary *_rates;
}

@end

@implementation Bank

- (id)init
{
    if (self = [super init]) {
        _rates = [NSMutableDictionary dictionary];
    }
    return self;
}

- (Money *)reduce:(id)source to:(NSString *)to
{
    if (![source respondsToSelector:@selector(reduceWithBank:to:)])
        return nil;
    return [source performSelector:@selector(reduceWithBank:to:) withObject:self withObject:to];
}

- (int)rateFrom:(NSString *)from to:(NSString *)to
{
    if ([from isEqualToString:to])
        return 1;
    NSNumber *rate = [_rates objectForKey:[[Pair sharedInstance] hashcode]];
    return [rate intValue];
}
- (void)addRateFrom:(NSString *)from to:(NSString *)to withRate:(int)rate
{
    Pair *pair = [Pair sharedInstance];
    [pair setFrom:from];
    [pair setTo:to];
    [_rates setValue:[NSNumber numberWithInt:rate] forKey:[pair hashcode]];
    
}

@end
