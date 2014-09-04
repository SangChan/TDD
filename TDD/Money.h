//
//  Money.h
//  TDD
//
//  Created by SangChan on 2014. 9. 4..
//  Copyright (c) 2014년 sangchan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Dollar;
@class Franc;
@interface Money : NSObject {
    int _amount;
}

@property (nonatomic) int amount;

- (BOOL)equals:(id)object;
+ (Dollar *)dollar:(int)amount;
+ (Franc *)franc:(int)amount;
//abstract
- (id)times:(int) multiplier;
@end
