//
//  MovieVM.swift
//  MoviesApp
//
//  Created by Aldair Cosetito Coral on 18/08/23.
//

import Foundation

final class MovieVM: ObservableObject {
    private let repository = MovieRepository()
    @Published private(set) var isLoading = false
    @Published private(set) var isError = false
    @Published private(set) var popular: [MovieDTO] = []
    @Published private(set) var topRated: [MovieDTO] = []
    @Published private(set) var upcoming: [MovieDTO] = []
    @Published private(set) var nowPlaying: [MovieDTO] = []
    @Published private(set) var genres: [GenreDTO] = []
    @Published var genreSelected: GenreDTO?
    
    var movies: [MovieDTO] = []
    
    var filtered: [MovieDTO] {
        let result = movies.filter { $0.genreIDS.contains(genreSelected?.id ?? 0) }
        return result
    }
    
    @MainActor
    func getMovie(_ typeList: MovieListType) async {
        do {
            isLoading = true
            let data = try await repository.getMovies(typeList)
            switch typeList {
            case .nowPlaying:
                nowPlaying = data.results
                movies.append(contentsOf: data.results)
            case .popular:
                popular = data.results
                movies.append(contentsOf: data.results)
            case .topRated:
                topRated = data.results
                movies.append(contentsOf: data.results)
            case .upcoming:
                upcoming = data.results
                movies.append(contentsOf: data.results)
            }
            isLoading = false
        } catch {
            isError = true
        }
    }
    
    @MainActor
    func getGenre() async {
        do {
            isLoading = true
            genres = try await repository.getGenre(true).genres
            isLoading = false
        } catch {
            isError = true
        }
    }
}
