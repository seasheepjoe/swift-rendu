import Foundation 

extension Date {
    func toString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }

    func getYearDifferenceFrom(date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: self, to: date).year!
    }
}

struct Email {
    var email: String
    init(email: String) {
        self.email = email
    }
    
    func isValid() -> Bool {
        let emailRgx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRgx)
        return emailTest.evaluate(with: self.email)
    }
}

class Existence {
    var birthdate: Date
    var age: Int

    init(birthdate: Date) {
        self.birthdate = birthdate
        let date = Date()
        let calendar = Calendar.current
        self.age = calendar.component(.year, from: date) - calendar.component(.year, from: self.birthdate)
    }

    func willProbablyDieSoon() -> Bool {
        return self.age >= 100
    }
}

class Person: Existence {
    var gender: Gender
    var firstname: String
    var lastname: String
    var email: Email
    init(firstname: String, lastname: String, gender: Gender, email: Email, birthdate: Date) {
        self.firstname = firstname
        self.lastname = lastname
        self.gender = gender
        self.email = email
        super.init(birthdate: birthdate)
        self.birthdate = birthdate
    }

    func show() {
        print("firstname : \(self.firstname) ")
        print("lastname : \(self.lastname) ")
        
        switch self.gender {
        case .Male:
            print("gender : Male")
        case .Female:
            print("gender : Male")
        case .Other:
            print("gender : Other")
        }
        
        print("email valid : \(self.email.isValid())")
        print("email : \(self.email.email)")
        
        print("birthdate : \(self.birthdate)")
        print("age : \(self.age)")
        print("will die soon : \(self.willProbablyDieSoon())")
        
    }
}

let currentDate = Date()
let olderDate = Date(timeIntervalSinceReferenceDate: -123456789.0)

print(olderDate.getYearDifferenceFrom(date: currentDate))

let email = Email(email: "loiseaubillonlouis@gmail.com")
print(email.isValid())

let birthdate = Date(timeIntervalSinceReferenceDate: -2423456789.0)
let pp = Existence(birthdate: birthdate)
print(pp.willProbablyDieSoon())


let person = Person(firstname: "Louis", lastname: "Loiseau-Billon", gender: Gender.Male, email: Email(email: "loiseaubillonlouis@gmail.com"), birthdate: Date(timeIntervalSinceReferenceDate: -2993456789.0))
person.show()
