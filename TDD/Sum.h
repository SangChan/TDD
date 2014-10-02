//
//  Sum.h
//  TDD
//
//  Created by SangChan on 2014. 9. 30..
//  Copyright (c) 2014년 sangchan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExpressionProtocol.h"
#import "Money.h"

@interface Sum : NSObject <ExpressionProtocol>

- (id)initWithAugend:(id)augend addend:(id)addend;
@end
