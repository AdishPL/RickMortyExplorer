//
//  DataService.swift
//  Networking
//
//  Created by Adrian Kaczmarek on 10/01/2024.
//

import Foundation

public struct DataService: APIInterfaceProvidable {
    public init() {}
    
    public func executeRequest<T>(_ request: APIRequest, expecting type: T.Type) async -> Result<T, APIError> where T: Codable {
        guard let urlRequest = prepareAsURLRequest(from: request) else {
            return .failure(.invalidURL)
        }

        do {
            let result = try await makeRequest(from: urlRequest)

            switch result {
            case .success(let data):
                guard !data.isEmpty else {
                    return .failure(.emptyData)
                }

                let dataWithPagination = try JSONDecoder().decode(DataWithPagination<T>.self, from: data)

                return .success(dataWithPagination.results)
            case .failure(let error):
                return .failure(error)
            }
        } catch {
            return .failure(.errorEncountered(error: error))
        }
    }

    private func prepareAsURLRequest(from apiRequest: APIRequest) -> URLRequest? {
        guard let url = apiRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = apiRequest.httpMethod
        return request
    }

    private func makeRequest(from request: URLRequest) async throws -> Result<Data, APIError> {
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return .success(data)
        } catch {
            return .failure(.errorEncountered(error: error))
        }
    }
}
