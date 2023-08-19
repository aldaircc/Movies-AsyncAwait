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
    case badUrl
}

let apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NTdhYTY1MjhjMmY2ZmUzZmYwMjk4NGFlMjA1OGQ2ZCIsInN1YiI6IjYyYWQ0ZjZlZGJhZDUwMDA4YjcwNzJjMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.s00_28SiIHXya-xc-QkukxS9y4II7U6O1lfCUdJresg"

struct Network: NetworkRequest {
    typealias Success = Data
    typealias Failure = Error
    
    func callUrl<T, R>(_ request: R, objectType: T.Type) async throws -> T where T : Decodable, T : Encodable, R : Request {
        guard let url = URL(string: request.endpoint) else {
            throw MovieError.badUrl
        }
        
        let params = (request.params.isEmpty) ? nil : try? JSONSerialization.data(withJSONObject: request.params, options: .prettyPrinted)
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = request.httpHeaders
        urlRequest.httpBody = params
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw MovieError.parsingError("Failed parsing response to URLResponse")
        }
        
        debugPrint("Url ==>", response.url ?? "")
        debugPrint("Headers ==>", request.httpHeaders)
        debugPrint("Method ==>", request.httpMethod)
        debugPrint("Status ==>", httpResponse.statusCode)
        debugPrint("Parameters ==>", request.params)
        debugPrint("Data Parameters ==>", urlRequest.httpBody)
        
        guard httpResponse.statusCode > 199 && httpResponse.statusCode < 300,
            let json = try? JSONDecoder().decode(objectType.self, from: data) else {
            throw MovieError.parsingError("Failed converting to object from data")
        }
        
        return json
    }
}
