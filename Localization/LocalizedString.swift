//
//  LocalizedString.swift
//  Localization
//
//  Created by Adrian Kaczmarek on 11/01/2024.
//

import SwiftUI

public struct LocalizedString: ExpressibleByStringLiteral {
    public var value: String { callAsFunction() }

    private let key: String
    private let bundles: [Bundle]

    public init(key: AppLocalizationKey) {
        self.key = key.rawValue
        self.bundles = [LocalizedModuleBundle]
    }

    public init(stringLiteral value: String) {
        self = LocalizedString(key: value)
    }

    public init(key: String, in bundles: Bundle?...) {
        self.key = key
        self.bundles = ([LocalizedModuleBundle, .main] + bundles).compactMap { $0 }
    }

    public func callAsFunction() -> String {
        return bundles
            .compactMap { bundle -> String? in
                let localized = bundle.localizedString(forKey: key, value: key, table: nil)
                if localized == key {
                    return nil
                }
                return localized
            }
            .first ?? key
    }

    public typealias ExtendedGraphemeClusterLiteralType = String

    public typealias StringLiteralType = String

    public typealias UnicodeScalarLiteralType = String
}
