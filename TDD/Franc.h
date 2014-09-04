//
//  Franc.h
//  TDD
//
//  Created by SangChan on 2014. 9. 4..
//  Copyright (c) 2014년 sangchan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Money.h"

@interface Franc : Money

- (id)initWithAmount:(int) thisAmount;
- (id)times:(int)multiplier;

@end
