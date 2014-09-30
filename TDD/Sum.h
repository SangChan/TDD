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

@interface Sum : NSObject <ExpressionProtocol> {
    Money *_augend;
    Money *_addend;
}

@property (nonatomic) Money *augend;
@property (nonatomic) Money *addend;

- (id)initWithAugend:(Money *)augend addend:(Money *)addend;

@end
