//
//  StatusFilter.swift
//  RickMortyExplorer
//
//  Created by Adrian Kaczmarek on 11/01/2024.
//

import Localization

// TODO: Filters should mapped to Character encapsulated properties (like Status and Gender)
enum StatusFilter: String, CaseIterable, Equatable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "Unknown"

    var appLocalizedKey: AppLocalizationKey {
        switch self {
        case .alive:
                .filterStatusAlive
        case .dead:
                .filterStatusDead
        case .unknown:
                .filterStatusUnknown
        }
    }
}
