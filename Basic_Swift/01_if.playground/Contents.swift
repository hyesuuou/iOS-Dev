import UIKit

var isDarkMode: Bool = false

// 다크모드 여부

if (isDarkMode != true) {
    print("다크모드 아닙니다.")
} else {
    print("다크모드가 입니다.")
}

if isDarkMode != true {
    print("다크모드 아닙니다.")
} else {
    print("다크모드가 입니다.")
}

if isDarkMode {
    print("다크모드 입니다.")
} else {
    print("다크모드가 아닙니다.")
}

if !isDarkMode {
    print("다크모드 아닙니다.")
} else {
    print("다크모드가 입니다.")
}

// 삼항연산자 사용
var title: String = isDarkMode == true ? "다크모드 입니다." : "다크모드가 아닙니다"
print("삼항연산자", title)

var title2: String = isDarkMode ? "다크모드 입니다." : "다크모드가 아닙니다"
print("삼항연산자", title2)

var title3: String = !isDarkMode ? "다크모드 아닙니다." : "다크모드가 입니다"
print("삼항연산자", title2)
