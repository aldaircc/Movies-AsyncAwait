//
//  GenreModel.swift
//  MoviesApp
//
//  Created by Aldair Cosetito Coral on 17/08/23.
//

import Foundation

struct GenreModel: Request {
    typealias Model = Bool
    var endpoint: String = ""
    var params: [String : Any]
    
    init(_ model: Bool) {
        endpoint = (model) ? "genre/movie/list" : "genre/tv/list"
        params = [:]
    }
    
    mutating func updateRequest() {
        endpoint = baseUrl + endpoint
    }
}
