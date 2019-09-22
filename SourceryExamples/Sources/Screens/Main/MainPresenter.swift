//
//  MainPresenter.swift
//  SourceryExamples
//
//  Created by stnamco on 2018/10/16.
//  Copyright © 2018年 namco. All rights reserved.
//

import Foundation

protocol MainInput: class {
    func reload()
}

protocol MainOutput: class {
    var items: [Repository] { get }
}

protocol MainView: class, HumbleObject {
    func presentAlert(error: Error)
    func updateItems()
}

final class MainPresenter: Injectable {
    struct Dependency {
        var repository: ItemRepository
    }
    
    private weak var view: MainView!
    private(set) var dependency: Dependency!
    private var isLoading: Bool = false
    
    private(set) var items: [Repository] = [] {
        didSet {
            view.updateItems()
        }
    }
    
    init(view: MainView, dependency: Dependency) {
        self.view = view
        self.dependency = dependency
        
        print("props \(String(describing: dependency))")
        
        configure()
    }
    
    private func configure() {
        dependency.repository.delegate = self
    }
}

// MARK: - Input

extension MainPresenter {
    func reload() {
        loadRepositories()
    }
    
    private func loadRepositories() {
        guard !isLoading else {
            return
        }
        
        dependency.repository.read { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let value):
                self.items = value
                self.view.updateItems()
            case .failed(let error):
                print(error)
                self.view.presentAlert(error: error)
            }
        }
    }
}

// MARK: - RepositoryDelegate

extension MainPresenter: RepositoryDelegate {
    func respository(changeTo isLoading: Bool) {
        self.isLoading = isLoading
    }
}
