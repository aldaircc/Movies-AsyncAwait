//
//  Network.swift
//  MoviesApp
//
//  Created by Aldair Cosetito Coral on 16/08/23.
//

import Foundation

enum MovieError: Error {
    case networkError(Error)
    case parsingError(String)
}

struct Network: NetworkRequest {
    typealias Success = Data
    typealias Failure = Error
    
    func callUrl<T>(_ url: URL, objectType: T.Type) async throws -> T where T : Decodable, T : Encodable {
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let json = try? JSONDecoder().decode(objectType.self, from: data) else {
            throw MovieError.parsingError("Failed converting to object from data")
        }
        
        return json
    }
}
