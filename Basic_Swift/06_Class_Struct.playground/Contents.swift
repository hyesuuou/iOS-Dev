import UIKit

// 유튜버 (데이터) 모델 - struct / 구조체
struct YoutubereStruct {
    var name: String
    var subscribersCount: Int
}

var devJeong = YoutubereStruct(name: "정대리", subscribersCount: 99999)
var devJeongClone = devJeong

print("값 넣기전 devJeongClone.name: \(devJeongClone.name)")

devJeongClone.name = "ㅋㅋㅋㅋ"
print("값 넣은 후 devJeongClone.name: \(devJeongClone.name)")
print("값 넣은 후 devJeong.name: \(devJeong.name)")

// 클래스
class YoutuberClass {
    var name: String
    var subscribersCount: Int
    
    // 생성자 - 메모리에 올린다.
    // init으로 매개변수를 가진 생성자 메소드를 만들어야
    // 매개변수를 넣어서 그 값을 가진 객체를 만들 수 있다.
    init(name: String, subscribersCount: Int) {
        self.name = name
        self.subscribersCount = subscribersCount
    }
}

var jeongDaeRi = YoutuberClass(name: "정대리", subscribersCount: 99999)
var jeongDaeriClone = jeongDaeRi

print("값 넣기 전 jeongDaeRiClone.name: \(jeongDaeriClone.name)")

jeongDaeriClone.name = "ㅋㅋㅋㅋㅋㅋ수정"
print("값 넣은 후 jeongDaeriClone.name: \(jeongDaeriClone.name)")
print("값 넣은 후 jeongDaeri.name: \(jeongDaeRi.name)")
