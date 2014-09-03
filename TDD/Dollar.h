//
//  Dollar.h
//  TDD
//
//  Created by SangChan on 2014. 9. 3..
//  Copyright (c) 2014년 sangchan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dollar : NSObject

@property (nonatomic) int amount;

- (id)initWithAmount:(int) thisAmount;
- (void)times:(int)multiplier;

@end
