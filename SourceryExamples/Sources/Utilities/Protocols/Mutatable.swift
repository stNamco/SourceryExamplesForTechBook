//
//  Mutatable.swift
//  SourceryExamples
//
//  Created by stnamco on 2019/09/22.
//  Copyright © 2019 namco. All rights reserved.
//

import Foundation

protocol Mutatable {}

extension Mutatable {
    func mutated(mutator: (inout Self) -> Void) -> Self {
        var newValue = self
        mutator(&newValue)
        return newValue
    }
}
