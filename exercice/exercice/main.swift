//
//  main.swift
//  Exercices
//
//  Created by SUP'Internet 15 on 09/11/2018.
//  Copyright © 2018 SUP'Internet 15. All rights reserved.
//

import Foundation

print(condog(str: "oui", prefix: "L", suffix: "s"));
print(cleanHobbits(arr: ["Frodo", "Aragorn", "Boromir", "Legolas", "Gimli", "Gandalf", "Samsaget"]));
let currentDate = Date()
let olderDate = Date(timeIntervalSinceReferenceDate: -123456789.0)

print("2018".toDate(format: "YYYY"))

print(olderDate.getYearDifferenceFrom(date: currentDate))

let email = Email(email: "loiseaubillonlouis@gmail.com")
print(email.isValid())

let birthdate = Date(timeIntervalSinceReferenceDate: -2423456789.0)
let pp = Existence(birthdate: birthdate)
print(pp.willProbablyDieSoon())


let person = Person(firstname: "Louis", lastname: "Loiseau-Billon", gender: Gender.Male, email: "loiseaubillonlouis@gmail.com", birthdate: Date(timeIntervalSinceReferenceDate: -2993456789.0))
// person.show()

let person2 = Person(firstname: "Zya", lastname: "Nassurally", gender: Gender.Female, email: "zya.nassurally@gmail.com", birthdate: (date: "2000", format: "YYYY"))
// person2.show()

let api = ApiManager()
api.getRandomUserHydratedWithPerson(completion: {person in
    person.show()
})

RunLoop.main.run()
