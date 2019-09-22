//
//  Result.swift
//  SourceryExamples
//
//  Created by stnamco on 2019/09/22.
//  Copyright © 2019 namco. All rights reserved.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case failed(Error)
    
    init(_ value: Value) {
        self = .success(value)
    }
    
    init(_ error: Error) {
        self = .failed(error)
    }
}
