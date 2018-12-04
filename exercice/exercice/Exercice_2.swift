//
//  Exercice_2.swift
//  Exercices
//
//  Created by SUP'Internet 15 on 09/11/2018.
//  Copyright © 2018 SUP'Internet 15. All rights reserved.
//

import Foundation

func cleanHobbits(arr: [String]) -> (firstEl: String, lastEl: String, reversed: [String], length: Int) {
    var reversed = [String]();
    for arrayIndex in stride(from: arr.count - 1, through: 0, by: -1) {
        reversed.append(arr[arrayIndex]);
    }
    return (firstEl: arr.first!, lastEl: arr.last!, reversed: reversed, length: reversed.count);
}

