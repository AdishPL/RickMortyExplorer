//
//  APIError.swift
//  Networking
//
//  Created by Adrian Kaczmarek on 10/01/2024.
//

import Foundation

public enum APIError: Error {
    case invalidURL
    case emptyData
    case errorEncountered(error: Error)
}
