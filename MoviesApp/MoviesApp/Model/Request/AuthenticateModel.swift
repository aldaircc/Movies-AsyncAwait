//
//  AuthenticateModel.swift
//  MoviesApp
//
//  Created by Aldair Cosetito Coral on 17/08/23.
//

import Foundation

struct AuthenticateModel: Request {
    typealias Model = User
    var params: [String : Any]
    var endpoint: String
    var httpMethod: HttpMethod = .Post
    
    init(_ model: User) {
        self.endpoint = "authentication/token/validate_with_login"
        self.params = ["username": model.username, "password": model.password, "request_token": model.requestToken]
        updateRequest()
    }
    
    mutating func updateRequest() {
        self.endpoint = baseUrl + endpoint
    }
}
