//
//  APIEndpoint.swift
//  Networking
//
//  Created by Adrian Kaczmarek on 10/01/2024.
//

import Foundation

public protocol APIEndpoint {
    var path: String { get }
}

public enum RMEndpoint: String, APIEndpoint {
    ///Endpoint to get character info
    case character // ="character"
    ///Endpoint to get episode info
    case episode
    ///Endpoint to get location info
    case location

    public var path: String {
        return "/api/" + rawValue
    }
}
