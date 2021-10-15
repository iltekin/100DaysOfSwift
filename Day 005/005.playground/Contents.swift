import UIKit

// Fonksiyonlar

func printHelp() {
    let str = "Hello, how can i help you?"
    print(str)
}
// Klasik temel bir fonksiyon (PHP ile aynı yapıda)

printHelp()

func square(number: Int){
    print(number * number)
}

square(number: 8)

func square2(number: Int) -> Int {
    return number * number
}

let squareTwo = square2(number: 2)
print(squareTwo)

func sayHello(to name: String) {
    print("Hello, \(name)!")
}
// Parametreyi fonksiyon içinde name olarak isimlendirirken fonksiyona gönderirken to olarak isimlendiriyoruz
// Tam tersi hata veriyor

sayHello(to: "Sezer")

func greet(_ person: String, nicely: Bool = true){
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no! Again, \(person)!")
    }
}
// Default value kullanabiliyoruz

greet("Osman")
greet("Osman", nicely: false)

func kare(_ sayilar: Int...){
    for sayi in sayilar {
        print("\(sayi) kere \(sayi) = \(sayi * sayi)")
    }
}
// Sınırsız sayıda parametre için bu şekilde kullanım mevcut

//kare(sayilar: 1,2,3,4,5)
kare(1,2,3,4,5)

enum PasswordError: Error {
    case obvious
}

func passwordCheck(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    
    return true
}

do {
    try passwordCheck("password2")
    print("This password is OK")
} catch {
    print("Your password is too obvious")
}

func doubleInPlace(number: inout Int) {
    number *= 2
}
// inout özelliği ile parametreyi değişken gibi kullanabiliyoruz

var myNum = 10
doubleInPlace(number: &myNum)


