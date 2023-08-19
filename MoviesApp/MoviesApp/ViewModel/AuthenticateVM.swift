//
//  AuthenticateVM.swift
//  MoviesApp
//
//  Created by Aldair Cosetito Coral on 17/08/23.
//

import Foundation

final class AuthenticateVM: ObservableObject {
    private(set) var user: User = User(username: "", password: "", requestToken: "")
    private let repository = AuthenticateRepository()
    private(set) var isError = false
    private(set) var isLoading = false
    @Published var isLogged = false

    @MainActor
    func login(_ username: String, password: String) async {
        do {
            isLoading = true
            let token = try await repository.getToken()
            user = User(username: "aldair.loq.369", password: "C1ps@420$$", requestToken: token)
            isLogged = try await repository.login(user)
            isLoading = false
        } catch {
            debugPrint(error.localizedDescription)
            isError = true
            isLoading = false
        }
    }    
}
