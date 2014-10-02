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
#import "Bank.h"
#import "Sum.h"

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
    XCTAssertEqual([[Money dollar:10] amount], [[five times:2] amount], @"10 and five.amount is not equal!");
    XCTAssertEqual([[Money dollar:15] amount], [[five times:3] amount], @"15 and five.amount is not equal!");
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

- (void)testCurreccy
{
    XCTAssertTrue([@"USD" isEqualToString:[[Money dollar:1] currency]], @"Not Equal");
    XCTAssertTrue([@"CHF" isEqualToString:[[Money franc:1] currency]], @"Not Equal");
}

- (void)testDifferentClassEquality
{
    XCTAssertTrue([[[Money alloc]initWithAmount:10 currency:@"CHF"] equals:[[Franc alloc] initWithAmount:10 currency:@"CHF"]], @"Not Equal");
}

- (void)testSimpleAddtion
{
    Money *five = [Money dollar:5];
    id sum = [five plus:five];
    Bank *bank = [[Bank alloc] init];
    Money *reduced = [bank reduce:sum to:@"USD"];
    XCTAssertTrue([[Money dollar:10] amount] == [reduced amount], @"Not Equal");
}

- (void)testPlusReturnsSum
{
    Money *five = [Money dollar:5];
    id result = [five plus:five];
    Sum *sum = (Sum *)result;
    XCTAssertEqual(five, sum.augend, @"Not Equal");
    XCTAssertEqual(five, sum.addend, @"Not Equal");
}

- (void)testReduceSum
{
    id sum = [[Sum alloc] initWithAugend:[Money dollar:3] addend:[Money dollar:4]];
    Bank *bank = [Bank new];
    Money *result = [bank reduce:sum to:@"USD"];
    XCTAssertEqual([[Money dollar:7] amount], [result amount], @"Not Equal");
}

- (void)testReduceMoney
{
    Bank *bank = [Bank new];
    Money *result = [bank reduce:[Money dollar:1] to:@"USD"];
    XCTAssertEqual([[Money dollar:1] amount], [result amount]);
}

- (void)testReduceMoneyDifferentCurrency
{
    Bank *bank = [Bank new];
    [bank addRateFrom:@"CHF" to:@"USD" withRate:2];
    Money *result = [bank reduce:[Money franc:2] to:@"USD"];
    XCTAssertEqual([[Money dollar:1] amount], [result amount]);
}

- (void)testIdentityRate
{
    XCTAssertEqual(1, [[Bank new] rateFrom:@"USD" to:@"USD"]);
}

- (void)testMixedAddition
{
    id fiveBucks = [Money dollar:5];
    id tenFrancs = [Money franc:10];
    Bank *bank = [Bank new];
    [bank addRateFrom:@"CHF" to:@"USD" withRate:2];
    Money *result = [bank reduce:[fiveBucks plus:tenFrancs] to:@"USD"];
    XCTAssertEqual([[Money dollar:10] amount], [result amount]);
}

- (void)testSumPlusMoney
{
    id fiveBucks = [Money dollar:5];
    id tenFrancs = [Money franc:10];
    Bank *bank = [Bank new];
    [bank addRateFrom:@"CHF" to:@"USD" withRate:2];
    id sum = [[[Sum alloc] initWithAugend:fiveBucks addend:tenFrancs] plus:fiveBucks];
    Money *result = [bank reduce:sum to:@"USD"];
    XCTAssertEqual([[Money dollar:15] amount], [result amount]);
}

- (void)testSumTimes
{
    id fiveBucks = [Money dollar:5];
    id tenFrancs = [Money franc:10];
    Bank *bank = [Bank new];
    [bank addRateFrom:@"CHF" to:@"USD" withRate:2];
    id sum = [[[Sum alloc] initWithAugend:fiveBucks addend:tenFrancs] times:2];
    Money *result = [bank reduce:sum to:@"USD"];
    XCTAssertEqual([[Money dollar:20] amount], [result amount]);
}

- (void)testPlusSameCurrencyReturnsMoney
{
    id sum = [[Money dollar:1] plus:[Money dollar:1]];
    XCTAssertTrue([sum isKindOfClass:[Money class]]);
}

@end
