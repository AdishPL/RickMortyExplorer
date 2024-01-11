//
//  Character.swift
//  Networking
//
//  Created by Adrian Kaczmarek on 10/01/2024.
//

import Foundation

// TODO: Introduce *Response* protocol entities, like DTO behaviour
public struct Character: Codable, Hashable {
    public var id: Int
    public var name: String
    public var status: String
    public var species: String
    public var gender: String
    public var image: URL
}
