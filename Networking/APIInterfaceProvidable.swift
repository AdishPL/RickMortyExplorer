//
//  APIInterfaceProvidable.swift
//  Networking
//
//  Created by Adrian Kaczmarek on 10/01/2024.
//

import Foundation

public protocol APIInterfaceProvidable {
    func executeRequest<T: Codable>(_ request: APIRequest, expecting type: T.Type) async -> Result<T, APIError>
}
