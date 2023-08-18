//
//  LoginView.swift
//  MoviesApp
//
//  Created by Aldair Cosetito Coral on 16/08/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authVM: AuthenticateVM
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Text("User's Authentication")
            TextField("Username", text: $username)
            SecureField("Password", text: $password)
            Spacer()
                .frame(width: 200, height: 20, alignment: .center)
            Button("Login") {
                Task {
                    await authVM.login(username, password: password)
                }
            }
        }
        .padding(.horizontal, 10)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
