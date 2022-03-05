import UIKit

// range(레인지, 범위)
// 0...5 -> 0, 1, 2, 3, 4, 5
// 0..<5 -> 0, 1, 2, 3, 4
for index in 0...5 {
    print("호호 index: \(index)")
}

for index in 0..<5 {
    print("호호22 index: \(index)")
}


// 빈 배열 만들기
//var randomInts: [Int] = []
var randomInts: [Int] = [Int]()

// 해당하는 요소를 쓰지 않을 떄
for _ in 0..<25 {
    let randomNumber = Int.random(in: 0...100)
    randomInts.append(randomNumber)
}

print(randomInts)


