import UIKit
var greeting = "Hello, playground"

// Bir sınıf oluşturalım
class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String){
        self.name = name
        self.breed = breed
    }
}

var comar = Dog(name: "Çomar", breed: "Street Dog")
print(comar.name)

// Dog sınıfından başka bir sınıf türettik
class Poodle: Dog {
    init(name: String){
        // Parent class'ın init fonksiyonunu çağırmak için super.init kullanıyoruz
        super.init(name: name, breed: "Poodle")
    }
}

class Kopek {
    func makeNoise() {
        print("Hav hav!")
    }
}

class Kangal: Kopek {
    // Mevcut fonksiyonu override ettik
    override func makeNoise() {
        print("Hav hav hav hav!")
    }
}

Kangal().makeNoise()

// final class kullandığım için bu class'tan başka bir class türetilemiyor
final class Fruits {
    var name: String
    var color: String
    
    init(name: String, color: String){
        self.name = name
        self.color = color
    }
}

var apple = Fruits(name: "Apple", color: "Red")
print(apple.name, "is", apple.color)


// Class ile oluşturulan objeyi kopyalamak
class Singer {
    var name = "Taylor Swift"
}

// değişken değil de sabit (let) bile olsa mutating olacak yani property'si değişir
// sadece class içinde let diye belirtilirse property değişmez
var singer = Singer()
print(singer.name)

// Direkt olarak propertylerle beraber geldi
var singerCopy = singer
singerCopy.name = "Justin Bieber"

// singer objesini de değiştirdi
print(singer.name)

// deinit() ile fonksiyonu destroy ediyoruz
class Person {
    var name = "Sezer İltekin"
    
    init(){
        print("\(name) is alive!")
    }
    
    func printGreeting(){
        print("Hello my name is \(name)")
    }
    
    deinit {
        print("\(name) is no more alive!")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}


