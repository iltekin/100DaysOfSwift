import UIKit

let firstScore  = 12
let secondScore = 4

let total       = firstScore + secondScore
let difference  = firstScore - secondScore
let xtimes      = firstScore * secondScore
let divided     = firstScore / secondScore
let remainder   = 13 % secondScore
// Matematik işlemlerini PHP gibi standart karakterlerle yapıyoruz

let luckyNumber     = 13
let secondNumber    = 24 + 32
// Direkt olarak sayılarla matematik işlemi yapıyoruz

let firstWords  = "Bir iskambil falında "
let secondWords = "çıkmıştık birbirimize"

let allWords = firstWords + secondWords
// Stringleri de birleştirebiliyoruz

let Actors = ["Cüneyt Arkın", "Ediz Hun", "Tarık Akan"]
let anotherActors = ["Kemal Sunal", "Şener Şen", "Münir Özkul"]
let AllActors = Actors + anotherActors
// Array birleştirdik. Fakat array + başka bir veri tipi hataya sebep olur.

var score = 95
score -= 5
// Direkt -= kullanarak çıkartma işlemi

var thirdWords = "Yıllar sonra bir gün seni anarsam "
thirdWords += "kulakların değil kalbin çınlasın"
// Birleştirme işlemini yeni bir değişken kullanmadan da yapabiliyoruz

firstScore == secondScore
firstScore != secondScore
firstScore < secondScore
firstScore >= secondScore
// Karşılaştırma operatörleri PHP ile aynı şekilde kullanılıyor

"Sezer" > "Osman"
// Stringler de alfabetik olarak karşılaştırılabiliyor

let firstCard   = 11
let secondCard  = 10

if firstCard + secondCard == 21 {
    print("Blackjack!")
} else if firstCard != 11 {
    print("First Card is not Eleven!")
} else {
    print("Regular Card")
}
// If Else yapısı PHP ile aynı, sadece paranteze alma yok

if firstCard > 10 && secondCard > 10 {
    print("Both cards bigger than 10")
}

if firstCard > 10 || secondCard > 10 {
    print("At least one of the cards is bigger than 10")
}
// If else kombinasyonları && ve || işaretleriyle yapılıyor

print(firstCard == secondCard ? "Cards are same" : "Cards are not same")
// Üçlü operatörle bu şekilde pratik if else yapısı kurulabiliyor

let weather = "sunny"

switch weather {
case "rain":
    print("Do not forget your umbrella")
case "sunny":
    print("Do you have your sunglasses?")
default:
    print("Have a good day")
}
// Switch case yapısı bu şekilde kuruluyor. Öncelikle case deklare edilmesi gerekiyor.

let lastScore = 99

switch lastScore {
case 0..<65:
    print("You have failed!")
case 65..<90:
    print("Pretty good!")
default:
    print("Perfect score!")
}
// Aralık içinde bu şekilde sonuç verebiliyor
// Range Operators olarak geçiyor


