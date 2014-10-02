//
//  Sum.m
//  TDD
//
//  Created by SangChan on 2014. 9. 30..
//  Copyright (c) 2014년 sangchan. All rights reserved.
//

#import "Sum.h"

@implementation Sum

@synthesize addend = _addend;
@synthesize augend = _augend;

- (id)initWithAugend:(Money *)augend addend:(Money *)addend
{
    if (self = [super init]) {
        _augend = augend;
        _addend = addend;
    }
    return self;
}

- (Money *)reduceWithBank:(Bank *)bank to:(NSString *)to
{
    int amount = [[_augend reduceWithBank:bank to:to] amount] + [[_addend reduceWithBank:bank to:to] amount];
    return [[Money alloc] initWithAmount:amount currency:to];
}

- (id)plus:(id)addend
{
    //TODO : just stub
    return nil;
}


@end
