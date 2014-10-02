//
//  ExpressionObject.h
//  TDD
//
//  Created by SangChan on 2014. 9. 4..
//  Copyright (c) 2014년 sangchan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Money, Bank;

@protocol ExpressionProtocol <NSObject>

- (id)plus:(id)addend;
- (Money *)reduceWithBank:(Bank *)bank to:(NSString *)to;

@end
