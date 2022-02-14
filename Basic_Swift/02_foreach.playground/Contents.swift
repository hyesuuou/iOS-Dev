import UIKit

// Collection(콜렉션) - 데이터를 모아둔 것
// 종류 - 배열(Arrays), Sets, Dictionaries, (Tuple)
// 배열
var myArray: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// myArray안의 내용을 가진 수만큼 반복하면서, 그때 가져온 내용을 item이라는 이름으로 담겠댜.
for item in myArray {
    print("item: \(item)")
}

// 반복을 돌때 where를 이용해 특정한 조건을 넣기 가능
for item in myArray where item > 5 {
    print("5보다 큰 수만 돌기 item: \(item)")
}

for item in myArray where item % 2 == 0 {
    print("짝수만 출력 item: \(item)")
}

for item in myArray where item % 2 != 0 {
    print("홀수만 출력 item: \(item)")
}
