//
//  ItemRepository.swift
//  SourceryExamples
//
//  Created by stnamco on 2019/09/22.
//  Copyright © 2019 namco. All rights reserved.
//

import Foundation

protocol RepositoryDelegate: class {
    func respository(changeTo isLoading: Bool)
}

protocol RepositoryType {}

protocol ItemRepository: RepositoryType {
    var items: [Repository] { get }
    var delegate: RepositoryDelegate? { get set }
    func read(completion: (Result<[Repository]>) -> Void)
}

class ItemRepositoryImpl: ItemRepository {
    private(set) var items: [Repository] = []
    
    private let apiClient: APIClient
    
    weak var delegate: RepositoryDelegate?
    
    init(apiClient: APIClient = LocalAPIClient()) {
        self.apiClient = apiClient
    }
    
    func read(completion: (Result<[Repository]>) -> Void) {
        delegate?.respository(changeTo: true)
        
        let request = ListRepositoriesRequest()
        
        apiClient.sendRequest(request, completion: { [weak self] result in
            delegate?.respository(changeTo: false)
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.items = response.repositories
                completion(.success(self.items))
            case .failed(let error):
                completion(.failed(error))
            }
        })
    }
}
