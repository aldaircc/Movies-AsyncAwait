//
//  MoviesAppApp.swift
//  MoviesApp
//
//  Created by Aldair Cosetito Coral on 16/08/23.
//

import SwiftUI

@main
struct MoviesAppApp: App {
    @ObservedObject var authVM = AuthenticateVM()
    @ObservedObject var moviesVM = MovieVM()
    
    var body: some Scene {
        WindowGroup {
            //ContentView()
            NavigationStack {
                LoginView()
                    .navigationDestination(isPresented: $authVM.isLogged) {
                        MovieView()
                    }
            }
            .environmentObject(authVM)
            .environmentObject(moviesVM)
        }
    }
}
