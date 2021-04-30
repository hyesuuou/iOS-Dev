## 프로토콜(protocol)이란?

프로토콜은 일종의 규칙, 규약이라고 할 수 있는데, Swift에서 프로토콜은 특정 역할을 수행하기 위한 메서드, 프로퍼티, 기타 요구사항들이 적혀있는 **하나의 "설명서(청사진)"**라고 할 수 있습니다. 

쉽게 말하면, 프로토콜에 꼭 어떤 내용이 들어갈지에 대한 로드맵을 짜놓고, 이를 채택하는 부분에서 로드맵 내부의 세부적인 내용을 구현해주는 것 이라고 할 수 있습니다.

프로토콜의 요구사항을 충족시키는 모든 타입은 '**해당 프로토콜의 준수(confrom)한다**'고 합니다.

## 프로토콜의 사용

#### **1\. 프로토콜 정의하기**

```swift
protocol NameProtocol {
	
	// 프로토콜 정의
    기능1()
    기능2()
    // ...
}
```

-   **protocol** 이라는 키워드를 이용하여 정의합니다.
-   프로토콜 이름을 정해줍니다. 위에서 **NameProtocol** 부분이 프로토콜의 이름입니다.
-   내부에 필요한 조건들을 나열해줍니다. 이때 **기능의 구현은 하지 않습니다. (구현은 이후 채택부분에서 하게 됩니다!)**

```swift
protocol SampleProtocaol {

    // 프로퍼티 요구
    var topic: String { get set }
    var language: String { get }

    // 메서드 요구
    func talk() 

    // 이니셜라이저 요구
    init(topic: String, language: String)
}
```

-   내부 블럭 안에 필요한 부분들을 위와같이 정의할 수 있습니다.
-   프로퍼티를 요구할 때는 반드시 **var** 로 작성하고, **get/set의 가능 여부**를 명시합니다.
    -    get 가능 (읽기가능) -> { get }
    -    get, set 가능 (읽기, 쓰기 가능) -> { get set }

타입 프로퍼티는 **static 키워드**와 함께 선언합니다.

```swift
protocol SampleProtocaol {

    // 타입프로퍼티
    static var typeProp: Int { get set }
}
```

#### **2\. 프로토콜 사용하기 -> "프로토콜 채택!"**

프로토콜을 넘겨받아 사용하는 것을 **프로토콜을 채택한다**고 표현합니다.

프로토콜의 채택은 다음과 같이 이뤄집니다.

```swfit
(타입이름) (타입) : (채택할 프로토콜)
{
	// ..
}
```

상속받는 것 처럼 : (콜론) 이후에 채택할 프로토콜을 작성해줍니다.

이때 구현하는 부분에는 **채택할 프로토콜 내부에 요구된 사항을 모두 구현해줘야합니다**. 만약 구현해주지 않으면 오류가 나게 됩니다. 

(이때 fix 버튼을 누르면 자동으로 필요한 요소들이 채워지게 됩니다.)

프로토콜을 채택한 예시는 아래와 같습니다.

```swfit
// 프로토콜 정의
protocol SampleProtocaol {

     // 프로퍼티 요구
    var topic: String { get set }
    var language: String { get }

}

// 프로토콜 채택
struct ProtocolEx : SampleProtocaol {
    var topic: String
    var language: String
    
}
```

상속과 달리 **여러 개의 프로토콜을 채택할 수도 있습니다**. 상속받을 클래스(슈퍼클래스)를 먼저 적은 후, 채택하려는 프로토콜을 적어줍니다.

```swfit
protocol Readable {
    func read()
}

protocol Writeable {
    func write()
}

protocol ReadSpeakable: Readable {
    func speak()
}

protocol ReadWriteSpeakable: Readable, Writeable {
    func speak()
}

class SuperClass: Readable {
    func read()
    {
        // 구현..
    }
}

class SubClass: SuperClass, Writeable, ReadSpeakable {
    /**
            SuperClass를 상속받음
            Writeable, ReadSpeakable 프로토콜을 채택함
     */
    
    func write() {
        // 구현
    }
    
    func speak() {
        // 구현 
    }
    
}
```
