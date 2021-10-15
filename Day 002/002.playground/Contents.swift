import UIKit

var greeting = "Hello, playground"

/* ARRAYS */
let sezer = "Sezer İltekin"
let yilmaz = "Yılmaz Çakar"
let ubeyid = "Ubeyid Öz"
let kerim = "Kerim Akgümüş"

let arkadaslar = [sezer, yilmaz, ubeyid, kerim, "Steve Jobs"]
// Array içine değişken veya string (veya başka bir data tipi) eklenebilir
// Array PHP'de olduğu gibi sıfırdan başlar
// Array içinde bulunmayan bir key çağırmak hataya sebep olur

arkadaslar[4]

/* SETS */
let renkler = Set(["mavi", "sarı", "siyah", "yeşil", "kırmızı"])
let renkler2 = Set(["mavi", "sarı", "siyah", "yeşil", "kırmızı", "siyah", "yeşil", "kırmızı"])
// Array benzeri fakat belli bir sıralamaya sahip değil
// Aynı değere sahip olanlar ignore edilir
// Array içinden bir elemana ulaşırken tüm array kontrol edilirken set'te çok daha hızlı bir kontrol yapılabiliyor. Şu elemanı içeriyor mu sorusunun cevabı için Set, Array'den daha kullanışlı.

/* TUPLES */
var isim = (first: "Sezer", last: "İltekin")
isim.0
isim.last

// Tuple'lar JSON'a benziyor. Tanımlandıktan sonra içeriği değişebilir ama veri tipi değişemez.

var kisi = (ad: "Sezer İltekin", yas: 33, isMarried: true)

/* DICTIONARIES */
let meyveRenkleri = [
    "elma": "kırmızı",
    "armut": "sarı",
    "portakal": "turuncu"
]
// PHP'deki array gibi, key ve value string olarak belirlenebiliyor
// Farklı veri tipi ekleyince hata veriyor. Mevcut olmayan bir key gösterince nil diye çıktı veriyor

meyveRenkleri["armut"] // sarı
meyveRenkleri["armutx"] //nil

meyveRenkleri["armutx", default: "Bilinmiyor"]
// Dictionary içinde bulunmayan bir key sonucu nil almamak için default bir değer belirleyebiliyoruz. Bu harika!

// Boş Dictionary oluşturma
var takimlar = [String: String]()
takimlar["sezer"] = "Fenerbahçe"
// Bu şekilde de Dictionary oluşturulabiliyor
var scores = Dictionary<String, Int>()

// Boş Array oluşturma
var sonuclar = [Int]()
// Bu şekilde de boş array oluşturulabiliyor
var results = Array<Int>()

// Boş Set Oluşturma
var kelimeler = Set<String>()
var sayilar = Set<Int>()

// ENUM
enum status {
    case success
    case failure
}

let sonuc = status.success

enum Activity {
    case exercise(sport: String)
    case traveling(kilometers: Int)
    case eating(food: String)
    case coding(lang: String)
}

let doing = Activity.exercise(sport: "Gym")

enum Planet: Int {
    case earth = 9
    case mars
    case venus
    case jupiter
}

let earth = Planet(rawValue: 10)

// Enum'un tam olarak hangi amaçla kullanılacağını yeterince anlamadım
// Anladığım kadarıyla tanımlanmamış bir değeri yanlışlıkla kullanmamak için enumerations kullanılıyor.
// Üzerinde daha fazla çalışma yapmam gerekiyor.






