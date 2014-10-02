//
//  Sum.m
//  TDD
//
//  Created by SangChan on 2014. 9. 30..
//  Copyright (c) 2014년 sangchan. All rights reserved.
//

#import "Sum.h"

@implementation Sum

@synthesize augend, addend;

- (id)initWithAugend:(id)augend_ addend:(id)addend_
{
    if (self = [super init]) {
        self.augend = augend_;
        self.addend = addend_;
    }
    return self;
}

- (id)reduceWithBank:(id)bank to:(NSString *)to
{
    int amount = [[self.augend reduceWithBank:bank to:to] amount] + [[self.addend reduceWithBank:bank to:to] amount];
    return [[Money alloc] initWithAmount:amount currency:to];
}

- (id)plus:(id)addend_
{
    return [[Sum alloc] initWithAugend:self addend:addend_];
}

- (id)times:(int)multiplier
{
    return [[Sum alloc] initWithAugend:[self.augend times:multiplier] addend:[self.addend times:multiplier]];
}


@end
