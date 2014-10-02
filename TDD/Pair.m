//
//  Pair.m
//  TDD
//
//  Created by SangChan on 2014. 10. 1..
//  Copyright (c) 2014년 sangchan. All rights reserved.
//

#import "Pair.h"

@interface Pair () {
    NSString *_from;
    NSString *_to;
}

@end

@implementation Pair

@synthesize from = _from;
@synthesize to = _to;

static Pair *_pair = nil;
+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _pair = [[super alloc] init];
    });
    return _pair;
}

- (id)initWithFrom:(NSString *)from to:(NSString *)to
{
    if (self = [super init]) {
        _from = from;
        _to = to;
    }
    return self;
}

- (BOOL)equals:(id)object
{
    Pair *pair = (Pair *)object;
    return ([_from isEqualToString:[pair from]] && [_to isEqualToString:[pair to]]);
}
- (NSString *)hashcode
{
    return @"OnlyOnePair";
}

@end
