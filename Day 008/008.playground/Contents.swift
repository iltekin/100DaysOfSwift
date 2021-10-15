import SwiftUI

// Struct oluşturuyoruz
struct Personel {
    var isim : String
    var sicil : Int
    var yonetici: Bool
    var sube = "İstanbul"
}

var kisi = Personel(
    isim: "Sezer İltekin",
    sicil: 324302,
    yonetici: false,
    sube: "Ankara"
)

kisi.yonetici = true

// Struct içinde koşula bağlı property döndürebiliriz
struct Sport {
    var name: String
    var isOlympicSport: Bool
    
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an olympic sport"
        } else {
            return "\(name) is not an olympic sport"
        }
    }
}

var football = Sport(name: "football", isOlympicSport: false)
print(football.olympicStatus)
// football is not an olympic sport

var pentathlon = Sport(name: "pentathlon", isOlympicSport: true)
print(pentathlon.olympicStatus)
// pentathlon is an olympic sport

// didSet kullanımı
// (Bir property değiştiğinde çalışan fonksiyon)
// Değişiklik öncesi çalışan fonksiyon için kullanmamız gereken willSet (Nadir kullanılır)

struct ProgressX {
    var task: String
    var amount: Int {
        willSet {
            print("\(task) is now completed \(amount)%")
        }
    }

}

var progressx = ProgressX(task: "Loading data", amount: 10)
progressx.amount = 20
progressx.amount = 30
progressx.amount = 50 // Loading data is now completed 50%
progressx.amount = 85 // Loading data is now completed 85%
progressx.amount = 100 // Loading data is now completed 100% ...

// Struct içindeki fonksiyonlara method deniliyor ve Struct.method şeklinde çağırılıyor
struct City {
    var name: String
    var population: Int
    
    func collectTaxes() -> Int {
        return population * 1_000
    }
}

// Bir şehir türetelim
var city = City(name: "İstanbul", population: 16_000_000)
var totaltaxes = city.collectTaxes()

// Toplam vergiyi hesaplayalım
print("Total taxes: ", totaltaxes)

// Struct içinden oluşturduğumuz bir değişkeni yine struct içindeki bir fonksiyonla değiştireceğimiz zaman fonksiyonun başına mutating eklemeliyiz
struct Fruit {
    var fruit: String {
        didSet {
            print("Fruit changed as \(fruit)")
        }
    }
    
    mutating func changeFruit(_ newFruit: String) {
        fruit = newFruit
    }
}

var fruit = Fruit(fruit: "Banana")
fruit.changeFruit("Peach")
fruit.changeFruit("Orange")
fruit.fruit = "Pear" // Dışarıdan değiştirmek zaten standart olan bir işlem

// String property ve methodları
let string = "Do or do not, there is no try"
print(string)
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())
print(string.capitalized)

// Array property ve methodları
var toys = ["Woody"]
toys.append("Pinochio")
toys.sorted()
toys.firstIndex(of: "Pinochio")
toys.remove(at: 0)



struct Progress {
    var task: String
    var day: Int {
        didSet {
            print("\(task): \(day)/100 is DONE!")
        }
    }

}

var progress = Progress(task: "100 Days of SwiftUI", day: 0)
for day in 1...8 {
    progress.day = day
}
