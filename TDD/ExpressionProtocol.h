//
//  ExpressionObject.h
//  TDD
//
//  Created by SangChan on 2014. 9. 4..
//  Copyright (c) 2014년 sangchan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ExpressionProtocol <NSObject>

@property (nonatomic) id<ExpressionProtocol> augend;
@property (nonatomic) id<ExpressionProtocol> addend;

- (id<ExpressionProtocol>)plus:(id<ExpressionProtocol>)addend;
- (id)reduceWithBank:(id)bank to:(NSString *)to;
- (id)times:(int)multiplier;

@end
