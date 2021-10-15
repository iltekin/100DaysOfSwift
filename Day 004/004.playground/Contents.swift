import UIKit

let count = 1...13

for number in count {
    print("The number is \(number)")
}
// Klasik for döngüsü

for sayi in 88...99 {
    print("Sayımız \(sayi)")
}
// Array direkt döngü başında da oluşturulabilir

for _ in 1...3 {
    print("Bundan 3 tane olacak")
}
// Döngü içinde bir değişkene ihtiyaç duymadığımız zaman bu şekilde _ kullanıyoruz.

let singers = ["Tarkan", "Teoman", "Tarık Mengüç"]

for singer in singers {
    print("En sevdiğim şarkıcı \(singer)")
}

var number = 1

while number <= 8 {
    print("Bu cümleyi 8 defa göreceksin. Bu \(number)")
    number += 1
}
// While döngüsünü sonunu bilmediğimiz döngülerde kullanıyoruz

while false {
    print("This is false")
}
// False her zaman false olduğundan döngü çalışmadı ve Xcode bu konuda bir uyarı verdi

var newNumber = 8

repeat {
    print("New number is \(newNumber)")
} while newNumber < 1
// While yerine repeat kullandığımızda şart ne olursa olsun döngü 1 defa çalışıyor

let numbers = [1, 2, 3, 4, 5]
var random: [Int]

repeat {
    random = numbers.shuffled()
} while random == numbers
// Repeat'in güzel bir kullanımı.
// Önce shuffle yapıp sonra While ile aynı sıralama geldiyse tekrar shuffle yapmak yerine bir defa döngü yaptık

var countdown = 10

while countdown >= 0 {
    print(countdown)
    if countdown == 4 {
        print("I'm bored! Finish it!")
        break
    }
    countdown -= 1
}
// Döngüyü durdurmak için break kullanımı

outerLoop: for a in 1...10 {
    for b in 1...10 {
        let product = b * a
        print("\(b) x \(a) = \(product)")
        if product == 20 {
            break outerLoop
        }
    }
    print("\n")
}
// Loop'a isim vererek dıştaki loop'u break edebiliyoruz

let options = ["right", "left", "up", "down"]
let secretCombination = ["down", "right", "left", "right"]

combineLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            for option4 in options {
                let attempt = [option1, option2, option3, option4]
                print("Combination is \(attempt)")
                if attempt == secretCombination {
                    print("You have found the SECRET COMBINATION!")
                    break combineLoop
                }
            }
        }
    }
}
// İç içe looplarda break kullanımına başka bir örnek

for c in 1...10 {
    if c % 2 == 0 {
        continue
    }
    
    print(c)
}
// Sadece bir adımı pas geçmek için continue kullanıyoruz

var counter = 0

while true {
    print("")
    counter += 1
    
    if counter == 88 {
        break
    }
}
// Sonsuz döngü oluşturmak için while true kullanıyoruz


