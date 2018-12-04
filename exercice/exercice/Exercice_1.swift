//
//  Exercice_1.swift
//  Exercices
//
//  Created by SUP'Internet 15 on 09/11/2018.
//  Copyright © 2018 SUP'Internet 15. All rights reserved.
//

import Foundation

func condog(str: String, prefix: Character, suffix: String) -> String {
    var tmp = str;
    tmp.insert(prefix, at: tmp.startIndex);
    tmp.append(suffix);
    return tmp;
}
