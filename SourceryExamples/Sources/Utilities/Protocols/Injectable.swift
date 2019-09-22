//
//  Injectable.swift
//  SourceryExamples
//
//  Created by stnamco on 2018/10/16.
//  Copyright © 2018年 namco. All rights reserved.
//

import Foundation

protocol Injectable {
    associatedtype Dependency
}

protocol VCDependency {}
protocol VCInjectable: Injectable where Dependency: VCDependency {
    func setterInjection(with dependency: Dependency)
}
