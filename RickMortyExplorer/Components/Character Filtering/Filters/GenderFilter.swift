//
//  GenderFilter.swift
//  RickMortyExplorer
//
//  Created by Adrian Kaczmarek on 11/01/2024.
//

import Foundation
import Localization

enum GenderFilter: String, CaseIterable, Equatable {
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown = "Unknown"

    var appLocalizedKey: AppLocalizationKey {
        switch self {
        case .female:
                .filterGenderFemale
        case .male:
                .filterGenderMale
        case .genderless:
                .filterGenderGenderless
        case .unknown:
                .filterGenderUnknown
        }
    }
}
