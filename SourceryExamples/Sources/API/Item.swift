//
//  Item.swift
//  SourceryExamples
//
//  Created by stnamco on 2019/09/22.
//  Copyright © 2019 namco. All rights reserved.
//

import Foundation

struct Repository: AutoArbitrary, Equatable, Mutatable {
    var id: Int64
    var name: String
    var description: String
    var isStarred: Bool
}
