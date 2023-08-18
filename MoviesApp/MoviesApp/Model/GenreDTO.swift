//
//  GenreDTO.swift
//  MoviesApp
//
//  Created by Aldair Cosetito Coral on 17/08/23.
//

import Foundation

struct GenreDTO: Codable {
    let id: Int
    let name: String
}

struct GenresDTO: Codable {
    let genres: [GenreDTO]
}
