//
//  TDDTests.m
//  TDDTests
//
//  Created by SangChan on 2014. 9. 3..
//  Copyright (c) 2014년 sangchan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Dollar.h"
#import "Franc.h"

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
    Money *five = [Money dollar:5];
    XCTAssertEqual([[[Dollar alloc] initWithAmount:10] amount], [[five times:2] amount], @"10 and five.amount is not equal!");
    XCTAssertEqual([[[Dollar alloc] initWithAmount:15] amount], [[five times:3] amount], @"15 and five.amount is not equal!");
}

- (void)testEquality
{
    XCTAssertTrue([[Money dollar:5] equals:[Money dollar:5]], @"This is not!");
    XCTAssertFalse([[Money dollar:5] equals:[Money dollar:6]], @"This is True");
    
    XCTAssertTrue([[Money franc:5] equals:[Money franc:5]], @"This is not!");
    XCTAssertFalse([[Money franc:5] equals:[Money franc:6]], @"This is True");
    
    XCTAssertFalse([[Money dollar:5] equals:[Money franc:5]], @"This is not!");
}

- (void)testFrancMultiplication
{
    Franc *five = [Money franc:5];
    XCTAssertEqual([[Money franc:10] amount], [[five times:2] amount], @"10 and five.amount is not equal!");
    XCTAssertEqual([[Money franc:15] amount], [[five times:3] amount], @"15 and five.amount is not equal!");
}

@end
