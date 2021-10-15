// 7.Gün

import UIKit

// Fonksiyonun parametresi de boş (Void) bir fonksiyon
func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

// Bir closure oluşturup bunu üstteki fonksiyonun parametresi olarak kullanabiliriz
let myclo = { (place: String) in
    print("I'm going to \(place) in my car")
}

// myclo Closure'ını travel fonksiyonunun parametresi olarak kullandık ve çalıştı
travel(action: myclo)

// Closure'ı bu şekilde direkt parametre olarak da yazabiliyoruz
travel { (yer: String) in
    print("I'm going to \(yer) in my car")
}

// Fonksiyonu String return edecek şekilde yazabiliriz
func seyahat(gidilecek: (String) -> String) {
    print("Birazdan yola çıkacağım")
    let yer = gidilecek("Çatalca")
    print(yer)
    print("Sonunda evdeyim!")
}

// Bu durumda closure da aynı şekilde string return edecek şekilde yazılmalı
seyahat { (yer: String) -> String in
    return "\(yer)'ya gidiyorum"
}

// Son derece kısa yol!
seyahat {
    return "\($0)'ya hızlıca gidiyorum"
}


// Kendi yazdığım bir KDV hesaplama Closure/Fonksiyonu
func kdvHesapla(tutar: Double, bul dahilHaric: String, oran: (Double) -> Double){
    print("Ürün Fiyatı: \(tutar)")
    let kdvDahilFiyat = oran(tutar)
    print("KDV \(dahilHaric): \(kdvDahilFiyat)")
}

let tutar: Double = 250

// KDV Hariç
kdvHesapla(tutar: tutar, bul: "Dahil"){ (x: Double) -> Double in
    return x * 1.18
}

kdvHesapla(tutar: tutar, bul: "Hariç"){ (x: Double) -> Double in
    return x / 1.18
}

// Fonksiyon bir closure return ediyor
func goThere() -> (String) -> Void {
    return {
        print("I am going \($0)")
    }
}

// Fonksiyonu değişkene de atayabiliriz
var goNow = goThere()
goNow("Türkiye")

// Direkt de kullanabiliriz
goThere()("İstanbul")

// Capturing values
func yolculuk() -> (String) -> Void {
    var mesafe: Int = 1
    return {
        print("\($0) yolculuğumuz başladı.")
        print("\(mesafe) kilometre gittik.")
        mesafe += 1
    }
}

// Değişkeni tutabiliyoruz
var rota = yolculuk()
rota("Ankara") // 1km
rota("Ankara") // 2km
rota("Ankara") // 3km


