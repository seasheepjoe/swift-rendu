//
//  Exercice_5.swift
//  exercice
//
//  Created by SUP'Internet 14 on 29/11/2018.
//  Copyright © 2018 Sup. All rights reserved.
//

import Foundation

extension ApiManager {
    func getRandomUserHydratedWithPerson(completion: @escaping (Person) -> Void) {
        self.getRandomUser(completion: { data in
            let json = data as! [String: Any]
            let results = json["results"] as! [[String: Any]]
            let name = results[0]["name"]! as! [String: String]
            let firstname = name["first"]!
            let lastname = name["last"]!
            let email = results[0]["email"]! as! String
            let gender = results[0]["gender"]! as! String
            let dob = results[0]["dob"] as! [String: Any]
            let birthdate = dob["date"]! as! String
            let person = Person(firstname: firstname, lastname: lastname, gender: Gender(rawValue: gender)!, email: email, birthdate: birthdate.toDate(format: "yyyy-MM-dd'T'HH:mm:ssZ"))
            completion(person)
        })
    }
}
