import UIKit

// Bir fonksiyonun sonucunda nil döndürebiliriz
func User(for id: Int) -> String? {
    if id == 1 {
        return "Sezer İltekin"
    } else {
        return nil
    }
}

// Nil döndürebilen bir fonksiyonu çalıştırırken nil dönmesi durumunda
// gösterilecek default String'i belirtebiliyoruz
// Ayrıca birden fazla fonksiyonu func1() ?? func2() ?? "default" şeklinde de kullanabiliriz
var user = User(for: 15) ?? "Anonymous"

let scores = ["sezer": 100, "çağrı": 200, "merve": 300]

// Collectionlar her zaman optional döndürür
// Böylece bir collection içinde olmayan değer için 2 şekilde default atayabiliriz
var emirScore = scores["emir"] ?? 0
var emirScore2 = scores["emir", default:0]

let bands = ["Duman", "Grup 84", "MFÖ", "Model"]
// Aşağıdaki gibi art arda fonksiyonlar kullanılacaksa ve gelecek değer kesin değilse ? kullanıyoruz
// Optional chaining
var firstBand = bands.first?.uppercased()

let names = ["Vincent": "van Gogh", "Pablo": "Picasso", "Claude": "Monet"]
let surnameLetter = names["Vincent"]?.first?.uppercased() ?? "?"

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

// do,try,catch olayını bu şekilde kısaca kullanabiliyoruz
if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}
