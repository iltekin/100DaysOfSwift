// Benim ilk Swift kodlarım bunlar
// Sezer İltekin
// 12 Eylül 2021 Pazar Saat 10:15

import UIKit

var greeting = "Hello, playground"
greeting = "Selam, playground"
// Bir değişkeni atamak için "var" ile başlıyoruz. Bu yeni değişken oluşturuyoruz anlamına geliyor. Değiştirmek içinse değişken adının başına bir şey yazmıyoruz. Değişken string olarak oluşturulduysa yenisi yine string olmak zorunda.

var sayi = 13
// Integer türünde değişken

var uzunSayi = 80_000_000
// Uzun sayılarda sadece görsel olarak rahatlık sağlasın diye alt tire kullanabiliriz. Sonuç olarak sayı değerinde hiçbir değişikliğe sebep olmaz
uzunSayi = 15_000_000
// Burada integer türündeki değişkeni yine integer türünde başka bir değerle değiştirdik (string olamazdı)

var uzunCumle = """
    Selamlar
    benim adım Sezer.
    Sizin adınız nedir?
    """

var tekSatirUzunCumle = """
    Selamlar \
    Bu satırları kolay olsun diye alt alta yazıyorum \
    Fakat sondaki ters slash sayesinde yeni satır olarak \
    Görünmeyecek
    """

var pi = 3.141
pi = 3
// Double türünde değişken oluşturuyoruz
// Integer ile karıştırılamaz (Toplama çıkartma yapılamaz)

var toplam = sayi + uzunSayi // (sayi + pi hata verdi)

var durum = true
durum = false
// Boolean türünde değişken oluşturuyoruz

var eklemeOzelligi = "Biraz önce yazdığımız string'de \(greeting) demiştik :)"
// Bu özelliğe String Interpolation deniliyor
// Ters slash sonrası parantez içine değişken yazılabiliyor

let sabit = "Bu sabit bir değer"
// var yerine let kullandığımızda bu bir sabit (constant) oluyor ve değeri değiştirilemiyor. değişmesini istemeyeceğimiz önemli datalar için kullanışlı

let album: String = "Islak Islak"
let sene: Int = 1999
let yukseklik: Double = 1.69
let onay: Bool = false
// Swift yazdığımız değişkenlerin türünü tespit edebiliyor fakat istersek bu şekilde kesin tür tayini yapabiliriz. Peki neden kullanılır? Değişkene karşılık gelecek veriyi kontrol edebilmemiz için. Her zaman elle yazmıyoruz. Veya double olmasını istediğimiz bir değişkene ilk atamada integer verebiliriz. Bu da sonraki aşamalarda double değişiminde soruna sebep olur. Son olarak, değişken olarak atamak istediğimiz ama değerini henüz belirlemediğimiz zaman şöyle yaparız:

var sonraYazarim: String





