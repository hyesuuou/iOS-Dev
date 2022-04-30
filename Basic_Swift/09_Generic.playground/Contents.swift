import UIKit

struct MyArray<T> {
    
    // 제네릭을 담은 빈 배열
    var elements: [T] = [T]()
    
    // 생성자
    init(_ elements: [T]) {
        self.elements = elements
    }
}


struct Friend {
    var name: String
}

struct PpakCoder {
    var name: String
}

var mySomeArray = MyArray([1, 2, 3])
print("mySomeArray: ", mySomeArray)

var myStringArray = MyArray(["가", "나", "다"])
print("myStringArray: ", myStringArray)

let friend01 = Friend(name: "철수")
let friend02 = Friend(name: "영희")
let friend03 = Friend(name: "유진")

var myFriendsArray = MyArray([friend01, friend02, friend03])
print("myFriendArray", myFriendsArray )

