//
//  Bank.m
//  TDD
//
//  Created by SangChan on 2014. 9. 4..
//  Copyright (c) 2014년 sangchan. All rights reserved.
//

#import "Bank.h"
#import "Money.h"


@implementation Bank

- (id) reduce:(id)source to:(NSString *)to
{
    return [Money dollar:10];
}

@end
