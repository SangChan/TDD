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
    if (![source respondsToSelector:@selector(reduce:)])
        return nil;
    return [source performSelector:@selector(reduce:) withObject:to];
}

- (int)rateFrom:(NSString *)from to:(NSString *)to
{
    int rate = _rates objectForKeyedSubscript:<#(id)#>
    return ([from isEqualToString:@"CHF"] && [to isEqualToString:@"USD"])? 2 : 1;
}
- (void)addRateFrom:(NSString *)from to:(NSString *)to withRate:(int)rate
{
    [_rates setObject:[NSNumber numberWithInt:rate] forKey:[[Pair alloc] initWithFrom:from to:to]];
    
}

@end
