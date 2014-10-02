//
//  Pair.h
//  TDD
//
//  Created by SangChan on 2014. 10. 1..
//  Copyright (c) 2014년 sangchan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pair : NSObject

@property (nonatomic) NSString *from;
@property (nonatomic) NSString *to;

+ (id)sharedInstance;
- (id)initWithFrom:(NSString *)from to:(NSString *)to;
- (BOOL)equals:(id) object;
- (NSString *)hashcode;
@end
