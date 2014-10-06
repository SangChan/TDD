# Test-Driven Development Using Xcode With Objective-C

## 소개
켄트 벡의 명저, Test-Driven Development By Example 의 제 1부에서 만드는 통화 기능에 대한 부분을 Objective-C 와 Xcode 의 XCTest.framework 를 사용해서 구현한 프로젝트입니다. 해당 내용은 챕터 17장까지의 내용을 담고 있습니다. (코딩은 16장에서 끝납니다. 17장은 회고)

## 커밋 로그 분석

#### 1. Initial Commit
- 프로젝트 생성

#### 2. add dollar object
- testMultiplication 테스트 케이스 생성
- Dollar 객체 생성

#### 3. times method return Dollar object
- testMultiplication 테스트 케이스 수정
- Dollar의 times 메소드가 Dollar 를 리턴하도록 수정.

#### 4. add readme
- README.md 파일 추가

#### 5. add money, parent of dollar and franc
- testEquality, testFrancMultiplication 테스트 케이스 생성
- Dollar 에 equals 추가
- Franc 객체 추가

#### 6. add factory method on money
- 기존 테스트 케이스의 인스턴스 생성을 Money 를 통해서 하도록 수정
- Money 객체를 생성하고 하위 클래스의 생성자를 상위로 이동시킴.

#### 7. move up init method to super
- testCurreccy 테스트 케이스 추가
- 생성자에 currency 를 추가하고 상위 이동을 완료함.

#### 8. move up times to parent
- testDifferentClassEquality 테스트 케이스 생성
- equals 메소드의 조건을 class 에서 curruncy 로 바꿈
- 하위 클래스에 모두 존재하는 times 를 상위로 이동시킴

#### 9. test available with interface
- testSimpleAddtion, testPlusReturnSum 테스트 케이스 생성
- Expression메타포를 상속받은 Sum 클래스 생성. 해당 클래스를 생성하고 리턴하는 plus 메소드를 Money 에 생성.
- Expression 메타포는 예제상에서는 자바의 인터페이스 객체인데, 슈퍼클래스/인터페이스를 모두 리턴받을 수 있는 언어 특성상, Obj-C 에서는 힘든 구현이므로 id 타입으로 받도록 수정함.

#### 10. test for ExpressionProtocol protocol method
- testReduceSum, testReduceMoney 테스트 케이스 생성
- Expression 메타포에 reduce 메소드 추가후, 해당 인터페이스를 구현해야 하는 Sum과 Money 양쪽에 해당 메소드 구현.

#### 11. add rate, but hashtable is not equal to NSDictionary
- testReduceMoneyDifferentCurrency 테스트 케이스 생성
- 환율을 Bank 에 rate Dictionary 를 만들고 Pair 객체를 키값으로 하는 키밸류 쌍을 만들어 관리함.

#### 12. complete chapter14
- testIdentityRate 테스트 케이스 생성
- currency 가 같은 경우, 환율은 1을 반환해야 함.
- Pair 객체를 키값으로 하지 않고 싱글턴화 하고, 키는 해당 객체의 해쉬코드를 사용하는 방식으로 수정함.

#### 13. bug fixes
- Bank 의 rate 에서 환율 가져오는 부분에 버그가 있어 수정함.

#### 14. complete chapter 15
- testMixedAddition 테스트 케이스 생성
- Expression 메타포에서 reduce: 제거하고 plus: 추가함.
- Bank 에서 reduce: 메소드를 부르던 것을 reduceWithBank:to 메소드를 부르는 것으로 수정함.
- plus 메소드를 Sum 객체에서도 구현해야 하나 우선 스텁으로 구현만 해둠.

#### 15. encapsulation
- augend 와 addend 를 Expression 메타포에서 생성하는 것으로 변경함.

#### 16. complete chapter16
- testSumPlusMoney, testSumTimes, testPlusSameCurrencyReturnsMoney 테스트 케이스 생성
- Expression 메타포로 times 이동
- Sum에 times 및 plus 메소드 구현

#### 17. remove test case
- testPlusSameCurrencyReturnsMoney 테스트 케이스 제거 (숙제)

#### 18. add NSCopying protocol for Dicitionary on Bank Class
- Bank 에서 rate Dictionary 용 키로 Pair 객체를 온전히 사용할 수 있도록 setObject: forKey: 메소드를 사용하도록 함.
- Pair 클래스에서는 NSCopying 프로토콜을 선언하고 copyWithZone: 메소드를 구현하여 Pair.copy 에 대응할 수 있도록 함.


## 주의사항
- Expression 이라는 메타포를 대응시키기가 어려워서, ExpressionProtocol 을 만들었다.
Expression 을 리턴하거나 아규먼트로 쓰는 경우, id 타입을 사용하였다.
- Pair 객체를 저장하는 HashTable 을 NSMutableDictionary 로 대체하였으며, 이를 위해 키와 밸류 모두 id 타입으로 넣는 setObject:forKey: 를 사용하였다. 이때, key 값에__strong 형으로 선언된 객체를 넣을 경우, warning 이 발생하므로  Pair 객체에서 NSCopying 프로토콜의 copyWithZone: 을 구현한 후, copy 된 객체를 reference 로 넣도록 하였다.
- Sum 의 augend 와 addend 를 ExpressionProtocol 로 끌어올린 예제를 따라하다 보니 ExpressionProtocol 을 구현해야 하는 Money 에서 augend 와 addend 를 @synthesize 하지 않았다는 이유로 warning 이 발생한다.
- AssertEqual 에 대해 예제와는 다르게 굳이 amount 값을 가지고 비교하는데, 이유는 Xcode의 XCTest에서는 인스턴스의 id값을 먼저 비교하기 때문에 예제를 따르면 항상 실패하기 때문이다.