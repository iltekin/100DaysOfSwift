import UIKit

var age: Int = 33
print("Hello, my age is \(age)")

var phones: [Any] = ["Iphone X", "Iphone 11", "Iphone 12 Pro", 13]
print(phones[2])
type(of: phones)

phones.append("Samsung Note 20")
phones.insert("Nokia 3310", at: 0)

var quote = "To be or not to be"
quote += ", that is the question"

print(quote)

var sparklingWaters = ["best": "Beypazarı", "avarage": "Uludağ", "notBad": "Kınık", "nope": "Kızılay"]
sparklingWaters["best"]

for _ in 1...3 {
    print("hello!")
}

for sparklingWater in sparklingWaters {
    print("The ", sparklingWater.key, " is ", sparklingWater.value)
}

var counter = 1
var number = 2

while true {
    print("\(number) x 2 = \(number * 2) (\(counter). İşlem)")
    number = number * 2
    counter += 1
    
    if number > 1_000_000 {
        break
    }
}

let liveAlbums = 2

switch liveAlbums {
case 0:
    print("You're just starting out")

case 1:
    print("You just released iTunes Live From SoHo")

case 2:
    print("You just released Speak Now World Tour")

default:
    print("Have you done something new?")
}
