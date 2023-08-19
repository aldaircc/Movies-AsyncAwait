//
//  Request.swift
//  MoviesApp
//
//  Created by Aldair Cosetito Coral on 16/08/23.
//

import Foundation
enum HttpMethod: String {
    case Get, Post, Delete, Put
}

protocol NetworkRequest {
    associatedtype Success
    associatedtype Failure: Error
    func callUrl<T: Codable, R: Request>(_ request: R, objectType: T.Type) async throws -> T
}

protocol Request {
    associatedtype Model
    typealias HttpHeaders = [String: String]
    
    var baseUrl: String { get }
    var endpoint: String { get set }
    var httpHeaders: HttpHeaders { get }
    var params: [String: Any] { get }
    var httpMethod: HttpMethod { get }
    init(_ model: Model)
}

extension Request {
    var baseUrl: String { return "https://api.themoviedb.org/3/" }
    var httpMethod: HttpMethod { return .Get }
    var httpHeaders: HttpHeaders { return ["Accept": "application/json",
                                           "Content-Type": "application/json",
                                           "Authorization": "Bearer \(apiKey)"] }
}
