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

@end
