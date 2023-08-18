//
//  MovieRequestModel.swift
//  MoviesApp
//
//  Created by Aldair Cosetito Coral on 18/08/23.
//

import Foundation

enum MovieListType {
    case nowPlaying
    case popular
    case topRated
    case upcoming
}

struct MovieRequestModel: Request {
    typealias Model = MovieListType
    
    var endpoint: String = ""
    var params: [String : Any] = [:]
    
    init(_ model: MovieListType) {
        updateRequest(model)
    }
    
    mutating func updateRequest(_ model: MovieListType) {
        switch model {
        case .nowPlaying:
            endpoint = baseUrl + "movie/now_playing"
        case .popular:
            endpoint = baseUrl + "movie/popular"
        case .topRated:
            endpoint = baseUrl + "movie/top_rated"
        case .upcoming:
            endpoint = baseUrl + "movie/upcoming"
        }
    }
}
