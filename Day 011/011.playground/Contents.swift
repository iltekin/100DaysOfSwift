import UIKit

// Protokol oluşturuyoruz
protocol Purchaseable {
    var name: String { get set }
    // Burada sadece {get set} veya sadece {get} kullanabiliriz
    // Sebep: It's not possible to create set-only properties in Swift.
}

// Bir struct oluşturup Purchaseable protokolüne uymasını istiyoruz
struct Book: Purchaseable {
    // burada var name kullanmadığımızda xcode hata verecektir
    var name: String
}

// Fonksiyona parametre olarak Purchaseable protokolüne uyan bir değer (struct) şartını koyuyoruz
func buyItem(_ item: Purchaseable){
    print("\(item.name) has been purchased successfully!")
}

// Fonksiyonu çalıştırıyoruz
var book = Book(name: "Little Prince")
buyItem(book) // Little Prince has been purchased successfully!


// Protokol 1
protocol Payable {
    func calculateWages() -> Int
}

// Protokol 2
protocol NeedsTraining {
    func study()
}

// Protokol 3
protocol HasVacation {
    func takeVacation(days: Int)
}

// Protokol 4 (1,2,3)
// Bir protokol başka protokollerden miras alabilir (Protocol inheritance)
protocol Employee: Payable, NeedsTraining, HasVacation { }

// veya bir struct birden fazla protokole uyabilir
struct Employee2: Payable, NeedsTraining, HasVacation {
    
    func calculateWages() -> Int{
        return 1
    }
    
    func study(){
        print("No")
    }
    
    func takeVacation(days: Int){
        print("Yes")
    }
    
}

// Extension, var olan protokollere ek yapmaya yarar
extension Int {
    func squared() -> Int {
        return self * self
    }
    func isEven() -> Bool {
        return self % 2 == 0
    }
}

var number = 8
var squared = number.squared()  // 64
var isEven = number.isEven() // true

let mfo = ["Mazhar", "Fuat", "Özkan"]
let friends = Set(["Emir", "Zayn", "Theodor", "John", "Atlas", "Barbaros", "Ceren", "Ali Arda"])
let fruits = ["birinci": "Elma", "ikinci": "Armut", "ucuncu": "Portakal", "dorduncu": "Muz"]

// Extension yapısı Collection üzerinden tüm Collection tiplerine (Array, Set, Dictionary) etki ediyor
extension Collection {
    func summarize() -> Void {
        print("There are \(count) of us")
        
        for name in self {
            print(name)
        }
    }
}

mfo.summarize()
friends.summarize()
fruits.summarize()

let numbers = [4, 8, 14, 16]
// allSatisfy fonksiyonu da tüm Collection tiplerine uygulanabilen ve tüm elemanların sırayla sorgulandığı bir fonksiyon
numbers.allSatisfy { $0.isMultiple(of: 2) }
numbers.allSatisfy { $0.squared() > 0 }

// Protokoller de extense edilebiliyor
protocol Identifiable {
    var id: String { get set }
    func identify()
}

extension Identifiable {
    func identify(){
        print("My ID is \(id)")
    }
}

struct User: Identifiable {
    var id: String
}

var sezer = User(id: "Sezer İltekin")
sezer.identify()
