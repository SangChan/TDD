//
//  ExpressionObject.h
//  TDD
//
//  Created by SangChan on 2014. 9. 4..
//  Copyright (c) 2014년 sangchan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Money;

@protocol ExpressionProtocol <NSObject>

- (Money *)reduce:(NSString *)to;

@end
