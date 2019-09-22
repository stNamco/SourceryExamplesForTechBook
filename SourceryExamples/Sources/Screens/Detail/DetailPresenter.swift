//
//  DetailPresenter.swift
//  SourceryExamples
//
//  Created by stnamco on 2018/10/16.
//  Copyright © 2018年 namco. All rights reserved.
//

import Foundation

protocol DetailInput: class {
}

protocol DetailOutput: class {
    var title: String { get }
    var description: String { get }
}

protocol DetailView: class, HumbleObject {}

final class DetailPresenter: DetailInput, DetailOutput, Injectable {
    var title: String {
        return dependency.repository.name
    }
    
    var description: String {
        return dependency.repository.description
    }
    
    struct Dependency {
        let repository: Repository
    }
    
    private weak var view: DetailView!
    private(set) var dependency: Dependency!
    
    init(view: DetailView, dependency: Dependency) {
        self.view = view
        self.dependency = dependency
        
        print("props \(String(describing: dependency))")
    }
}
