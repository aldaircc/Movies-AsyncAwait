//
//  MovieRepository.swift
//  MoviesApp
//
//  Created by Aldair Cosetito Coral on 17/08/23.
//

import Foundation

final class MovieRepository {
    private let network = Network()
    
    func getGenre(_ isForMovie: Bool) async throws -> GenresDTO {
        let request = GenreModel(isForMovie)
        return try await network.callUrl(request, objectType: GenresDTO.self)
    }
    
    func getMovies(_ listType: MovieListType) async throws -> MoviesDTO {
        let request = MovieRequestModel(listType)
        return try await network.callUrl(request, objectType: MoviesDTO.self)
    }
}
