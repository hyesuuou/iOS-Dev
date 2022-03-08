import UIKit

// 옵셔널이란?
// 값이 있는지, 없는지 모른다.
var someVariable: Int? = nil
// var someVariable: Int = nil (불가능)

if someVariable == nil {
    someVariable = 90
}

print(someVariable)

// 언래핑이란?
// 감싸져 있는 것(optional)을 벗기는 것

if let otherVariable = someVariable {
    // someVariable에 값이 있다면 otherVariable에 넣는다.
    print("언래핑 되었다. 즉 값이 있다. otherVariable: \(otherVariable)")
} else {
    print("값이 없다.")
}

someVariable = nil

// someVariable이 비어있으면, 즉 값이 없으면 기본값으로 요놈을 넣겠다.
// someVariable에 값이 없으면 10을 넣겠다.
let myValue = someVariable ?? 10
print("myValue: \(myValue)")

var firstValue: Int? = 30
var secondValue: Int? = nil

print("firstValue: \(firstValue)")
print("secondValue: \(secondValue)")

unwrap(firstValue)
unwrap(secondValue)

func unwrap(_ parameter: Int?) {
    print("unwrap")
    // guard let -> 값이 없으면 리턴한다. (지나간다.)
    guard let unWrappedParam = parameter else { return }
    print("unwrappedParam: \(unWrappedParam)")
}
