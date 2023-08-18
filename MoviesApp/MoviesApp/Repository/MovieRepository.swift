//
//  MovieRepository.swift
//  MoviesApp
//
//  Created by Aldair Cosetito Coral on 17/08/23.
//

import Foundation

final class MovieRepository {
    let network = Network()
    
    func getGenre(_ isForMovie: Bool) async throws -> GenresDTO {
        let request = GenreModel(isForMovie)
        return try await network.callUrl(request, objectType: GenresDTO.self)
    }
    
    func getNowPlaying() {
        
    }
    
    func getPopular() {
        
    }
    
    func getTopRated() {
        
    }
    
    func getUpcoming() {
        
    }
}
