//
//  API.swift
//  SourceryExamples
//
//  Created by stnamco on 2019/09/22.
//  Copyright © 2019 namco. All rights reserved.
//

import Foundation

struct ListRepositoriesRequest: APIRequest, Equatable {
    typealias Response = ListRepositoriesResponse
}

struct ListRepositoriesResponse: Equatable {
    var repositories: [Repository]
}

struct StarRepositoryRequest: APIRequest, Equatable {
    typealias Response = StarRepositoryResponse
    var id: Int64
}

struct StarRepositoryResponse: Equatable {
    var repository: Repository
}

struct UnstarRepositoryRequest: APIRequest, Equatable {
    typealias Response = UnstarRepositoryResponse
    var id: Int64
}

struct UnstarRepositoryResponse: Equatable {
    var repository: Repository
}
