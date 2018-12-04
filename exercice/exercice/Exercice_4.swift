//
//  Exercice_4.swift
//  exercice
//
//  Created by SUP'Internet 14 on 29/11/2018.
//  Copyright © 2018 Sup. All rights reserved.
//

import Foundation

class ApiManager {
    var baseUrl: String = "https://api.randomuser.me/"
    
    func getRandomUser(completion: @escaping (Any) -> Void) {
        
        var request = URLRequest(url: URL(string: self.baseUrl)!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, err in
            
            do {
                let json = try? JSONSerialization.jsonObject(with: data!, options: [])
                completion(json!)
            } catch let error as NSError {
                print(error)
            }
        
            }.resume()
        
    }
}
