// 100 Days of SwiftUI - 9. Gün

struct User {
    var name: String
    var age: Int
    
    // Struct içinde init fonksiyonu ile direkt olarak yeni bir instance oluşturabiliyoruz
    // Burada önemli nokta init içinde mevcut tüm propertyleri tanımlamış olmak
    init(){
        name = "Sezer İltekin"
        age = 33
        print("A new user has been created")
    }
}

var person = User() // A new user has been created
print("User:", person.name) // User: Sezer İltekin

// Struct içinde init kullanırsak struct kendi init fonksiyonunu kaybediyor
// Bu durumda klasik yoldan yeni bir instance oluşturmak mümkün değil
// Bu durumla karşılaşmamak için init fonksiyonunu bir extension içine yazmamız gerekiyor
struct Employee {
    var name: String
    var yearsActive = 0
}

extension Employee {
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee…")
    }
}

var anonymousEmployee = Employee()
print(anonymousEmployee.name)

var employee = Employee(name: "Osman")
print(employee.name)



// Lazy var oluşturduğumuzda Struct içinde çağırmadan oluşmuyor
struct FamilyTree {
    init(){
        print("Creating family tree!")
    }
}

struct Person {
    var name: String
    // standart değişken önüne lazy koyarak sadece çağırıldığında gelmesini istiyoruz
    lazy var familyTree = FamilyTree()
    
    init(name: String){
        self.name = name
    }
}

var newPerson = Person(name: "Sezer İltekin")
newPerson.familyTree // Creating family tree!
print(newPerson.name) // Sezer İltekin

// Static property kullanmak
// self.classSize olarak kullanılmıyor çünkü static property o anki instance'a değil struct'a ait
struct Student {
    var name: String
    static var classSize = 0
    
    init(name: String){
        self.name = name
        Student.classSize += 1
    }
}

var sezer = Student(name: "Sezer İltekin")
var emrah = Student(name: "Emrah Çelik")

// Her bir instance öğrenci sayısını yükseltiyor
print(Student.classSize) // 2


// Private kullanımı, sadece Struct içinden erişim var
struct Embassies {
    var name: String
    private var id: Int
    
    init(name: String, id: Int){
        self.name = name
        self.id = id
    }
    
    func showID() -> String {
        return "This embassy's ID number is \(id)"
    }
}

var tr = Embassies(name: "Turkish Embassy", id: 90)
print(tr.name) // print(tr.id) hata verecektir


