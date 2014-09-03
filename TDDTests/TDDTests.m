//
//  TDDTests.m
//  TDDTests
//
//  Created by SangChan on 2014. 9. 3..
//  Copyright (c) 2014년 sangchan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Dollar.h"

@interface TDDTests : XCTestCase

@end

@implementation TDDTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMultiplication
{
    Dollar *five = [[Dollar alloc]initWithAmount:5];
    [five times:2];
    XCTAssertEqual(10, [five amount], @"10 and five times 2 is equal!");
}

@end
