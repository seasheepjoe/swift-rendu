//
//  Exercice_3.swift
//  exercice
//
//  Created by SUP'Internet 01 on 21/11/2018.
//  Copyright © 2018 Sup. All rights reserved.
//

import Foundation

extension String {
    func toDate(format: String) -> Date {
        let dateString = self
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: dateString)
        return date!
        
    }
}

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

struct Email: CustomStringConvertible {
    var description: String {
        return self.email
    }
    
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

enum Gender: String {
    case Male = "male"
    case Female = "female"
    case Other = "other"
}

class Person: Existence {
    
    var gender: Gender
    var firstname: String
    var lastname: String
    var email: Email
    
    init(firstname: String, lastname: String, gender: Gender, email: String, birthdate: (date: String, format: String)) {
        self.firstname = firstname
        self.lastname = lastname
        self.gender = gender
        self.email = Email(email: email)
        super.init(birthdate: birthdate.date.toDate(format: birthdate.format))
        self.birthdate = birthdate.date.toDate(format: birthdate.format)
    }
    
    init(firstname: String, lastname: String, gender: Gender, email: String, birthdate: Date) {
        self.firstname = firstname
        self.lastname = lastname
        self.gender = gender
        self.email = Email(email: email)
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
            print("gender : Female")
        case .Other:
            print("gender : Other")
        }
        
        print("email valid : \(self.email.isValid())")
        print("email : \(self.email)")
        
        print("birthdate : \(self.birthdate)")
        print("age : \(self.age)")
        print("will die soon : \(self.willProbablyDieSoon())")
        
    }
}

