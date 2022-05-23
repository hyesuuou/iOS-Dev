
struct My {
    
    var address: String
    
    var city: String {
        get {
            return address + "에 살아요"
        }
        set {
            self.address = newValue + "시"
        }
    }
    
}

var practice = My(address: "수원")

print("address", practice.address)
print("city", practice.city)

practice.city = "서울"

print(practice.address)
print(practice.city)
