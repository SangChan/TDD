//
//  ExpressionObject.h
//  TDD
//
//  Created by SangChan on 2014. 9. 4..
//  Copyright (c) 2014년 sangchan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ExpressionProtocol <NSObject>

@property (nonatomic) id augend;
@property (nonatomic) id addend;

- (id)plus:(id)addend;
- (id)reduceWithBank:(id)bank to:(NSString *)to;
- (id)times:(int)multiplier;

@end
