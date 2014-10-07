//
//  Money.h
//  TDD
//
//  Created by SangChan on 2014. 9. 4..
//  Copyright (c) 2014년 sangchan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExpressionProtocol.h"

@class Dollar;
@class Franc;
@interface Money : NSObject<ExpressionProtocol> {
    int _amount;
    NSString *_currency;
}

@property (nonatomic) int amount;

- (id)initWithAmount:(int)thisAmount currency:(NSString *)currency;
- (BOOL)equals:(id)object;
+ (id)dollar:(int)amount;
+ (id)franc:(int)amount;
//abstract
- (NSString *)currency;
@end
