//
//  MovieView.swift
//  MoviesApp
//
//  Created by Aldair Cosetito Coral on 18/08/23.
//

import SwiftUI

struct MovieView: View {
    @EnvironmentObject var vm: MovieVM
    
    var body: some View {
        VStack {
            Text("Hello, World!")
            
            HStack {
                ForEach(vm.genres, id: \.id) { genre in
                    Button {
                        print("\(genre.name)")
                        vm.genreSelected = genre
                    } label: {
                        Text(genre.name)
                    }
                }
            }
            
            if vm.filtered.count != 0 {
                VStack {
                    Text("filtered")
                    List(vm.filtered, id: \.id) { item in
                        Text(item.title)
                    }
                }
            } else {
                VStack {
                    List(vm.popular, id: \.id) { movie in
                        Text(movie.title)
                    }
                }
            }
        }
        .task {
            await vm.getGenre()
            await vm.getMovie(.nowPlaying)
            await vm.getMovie(.popular)
            await vm.getMovie(.upcoming)
            await vm.getMovie(.topRated)
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}
