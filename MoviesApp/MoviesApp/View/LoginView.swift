//
//  LoginView.swift
//  MoviesApp
//
//  Created by Aldair Cosetito Coral on 16/08/23.
//

import SwiftUI

struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Text("User's Authentication")
            TextField("Username", text: $username)
            SecureField("Password", text: $password)
            Spacer()
                .frame(width: .infinity, height: 20, alignment: .center)
            Button("Login") {
                print("Login")
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
