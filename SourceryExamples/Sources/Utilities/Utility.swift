//
//  Utility.swift
//  SourceryExamples
//
//  Created by stnamco on 2019/09/07.
//  Copyright © 2019 namco. All rights reserved.
//

import Foundation

protocol HumbleObject {}

protocol AutoArbitrary {}

// MEMO: Following code is example. will oraganize later.

struct Point: AutoArbitrary {
    let x: Int
    let y: Int
}

struct Person: AutoArbitrary {
    // sourcery: itHolds = "$0.characters.count > 0"
    let familyName: String
    
    // sourcery: itHolds = "$0.characters.count > 0"
    let firstName: String
    
    // sourcery: itHolds = "$0 >= 0"
    var age: Int
}
