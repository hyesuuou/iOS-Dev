import UIKit


// 함수, 메소드 정의
func myFunction(with name: String) -> String {
    return "안녕하세요? \(name) 입니다."
}

// 함수, 메소드를 호출한다 call
myFunction(with: "김혜수")

func myFunctonEmpty(_ name: String) -> String {
    return "안녕하세요? \(name) 입니다."
}

myFunctonEmpty("혜수")
