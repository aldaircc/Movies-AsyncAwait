//
//  TokenModel.swift
//  MoviesApp
//
//  Created by Aldair Cosetito Coral on 17/08/23.
//

import Foundation

struct TokenModel: Request {
    typealias Model = String
    var endpoint: String = "authentication/token/new"
    var params: [String : Any] = [:]
    var httpMethod: HttpMethod = .Get
    
    init(_ model: String = "") {
        self.params = [:]
        updateRequest()
    }
    
    mutating func updateRequest() {
        self.endpoint = baseUrl + endpoint
    }
}
