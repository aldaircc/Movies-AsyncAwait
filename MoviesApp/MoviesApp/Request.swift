//
//  Request.swift
//  MoviesApp
//
//  Created by Aldair Cosetito Coral on 16/08/23.
//

import Foundation

protocol NetworkRequest {
    associatedtype Success
    associatedtype Failure: Error
    func callUrl<T: Codable>(_ url: URL, objectType: T.Type) async throws -> T
}
