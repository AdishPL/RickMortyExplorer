//
//  APIRequest.swift
//  Networking
//
//  Created by Adrian Kaczmarek on 10/01/2024.
//

import Foundation

public class APIRequest {
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/"
    }

    let endpoint: APIEndpoint

    private let pathComponents: [String]

    private let queryParameters: [URLQueryItem]

    public var url: URL? {
        var components = URLComponents(string: Constants.baseUrl)
        components?.path = endpoint.path

        if !pathComponents.isEmpty {
            components?.path += "/" + pathComponents.joined(separator: "/")
        }

        if !queryParameters.isEmpty {
            components?.queryItems = queryParameters.map {
                URLQueryItem(name: $0.name, value: $0.value)
            }
        }

        return components?.url
    }

    public let httpMethod = "GET"

    public init(endpoint: APIEndpoint,
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}

public extension APIRequest {
    static let listCharactersRequest = APIRequest(endpoint: RMEndpoint.character)
}
