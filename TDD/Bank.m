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

@implementation Bank

- (Money *)reduce:(id)source to:(NSString *)to
{
    if (![source respondsToSelector:@selector(reduce:)])
        return nil;
    return [source performSelector:@selector(reduce:) withObject:to];
}

@end
