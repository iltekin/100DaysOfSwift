import UIKit


// Closures için en basit örnek. Bir değişkene fonksiyon gibi atanabiliyor.
var message = {
    print("Hello World!")
}

message()

// Bir closure'a parametre ekleyebiliyoruz
var going = { (place: String) in
    print("I'm going to \(place)")
}

going("Istanbul")

// Parametresiz de dönüş veri türünü boş parantezle belirleyebiliyoruz
let payment = { () -> Bool in
    print("Paying to anonymous person")
    return true
}

payment()

let driving = {
    print("I am going with my car")
}

func travel(action: () -> Void){
    print("I'm ready to go")
    action()
    print("I arrived")
}

travel(action: driving)

// Fonksiyonu bu şekilde de kullanabiliyoruz (İlginç)
travel(){
    print("I am coming by bus!")
}

// Hatta direkt parantezsiz de oluyor
travel {
    print("I am walking because i don't have a driver license!")
}

func animate(duration: Double, animations: () -> Void){
    print("Starting a \(duration) second animation…")
    animations()
}

animate(duration: 3.14, animations: {
    print("Fade out the image")
})

animate(duration: 5.12){
    print("Destroy the image")
}
