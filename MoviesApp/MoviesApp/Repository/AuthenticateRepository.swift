//
//  AuthenticateRepository.swift
//  MoviesApp
//
//  Created by Aldair Cosetito Coral on 17/08/23.
//

import Foundation

final class AuthenticateRepository {
    let network = Network()
    
    func login(_ user: User) async throws {
        let request = AuthenticateModel(user)
        try await network.callUrl(request, objectType: SessionResponse.self)
    }
    
    func getToken() async throws -> String {
        let tokenRequest = TokenModel()
        let token = try await network.callUrl(tokenRequest, objectType: SessionResponse.self)
        return token.request_token
    }
}
