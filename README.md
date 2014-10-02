# Test-Driven Development Using Xcode With Objective-C

## 소개
켄트 벡의 명저, Test-Driven Development By Example 의 제 1부에서 만드는 통화 기능에 대한 부분을 Objective-C 와 Xcode 의 XCTest.framework 를 사용해서 구현한 프로젝트입니다. 해당 내용은 챕터 17장까지의 내용을 담고 있습니다. (코딩은 16장에서 끝납니다. 17장은 회고)

## 커밋 로그 분석

#### 1. Initial Commit
#### 2. add dollar object
#### 3. times method return Dollar object
#### 4. add readme
#### 5. add money, parent of dollar and franc
#### 6. add factory method on money
#### 7. move up init method to super
#### 8. move up times to parent
#### 9. test available with interface
#### 10. test for ExpressionProtocol protocol method
#### 11. add rate, but hashtable is not equal to NSDictionary
#### 12. complete chapter14
#### 13. bug fixes
#### 14. complete chapter 15
#### 15. encapsulation
#### 16. complete chapter16
#### 17. remove test case
#### 18. add NSCopying protocol for Dicitionary on Bank Class

## 주의사항
- Expression 이라는 메타포를 대응시키기가 어려워서, ExpressionProtocol 을 만들었다.
Expression 을 리턴하거나 아규먼트로 쓰는 경우, id 타입을 사용하였다.
- Pair 객체를 저장하는 HashTable 을 NSMutableDictionary 로 대체하였으며, 이를 위해 키와 밸류 모두 id 타입으로 넣는 setObject:forKey: 를 사용하였다. 이때, key 값에__strong 형으로 선언된 객체를 넣을 경우, warning 이 발생하므로  Pair 객체에서 NSCopying 프로토콜의 copyWithZone: 을 구현한 후, copy 된 객체를 reference 로 넣도록 하였다.
- Sum 의 augend 와 addend 를 ExpressionProtocol 로 끌어올린 예제를 따라하다 보니 ExpressionProtocol 을 구현해야 하는 Money 에서 augend 와 addend 를 @synthesize 하지 않았다는 이유로 warning 이 발생한다.
- AssertEqual 에 대해 예제와는 다르게 굳이 amount 값을 가지고 비교하는데, 이유는 Xcode의 XCTest에서는 인스턴스의 id값을 먼저 비교하기 때문에 예제를 따르면 항상 실패하기 때문이다.