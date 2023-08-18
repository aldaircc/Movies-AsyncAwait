//
//  SessionResponse.swift
//  MoviesApp
//
//  Created by Aldair Cosetito Coral on 17/08/23.
//

import Foundation

struct SessionResponse: Codable {
    let success: Bool
    let expires_at: String
    let request_token: String
}
