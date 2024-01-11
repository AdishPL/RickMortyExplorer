//
//  DataWithPagination.swift
//  Networking
//
//  Created by Adrian Kaczmarek on 10/01/2024.
//

import Foundation

public struct DataWithPagination<Result: Decodable>: Decodable {
    public var results: Result
}
