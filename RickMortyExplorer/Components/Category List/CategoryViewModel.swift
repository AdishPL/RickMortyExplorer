//
//  CategoryViewModel.swift
//  RickMortyExplorer
//
//  Created by Adrian Kaczmarek on 10/01/2024.
//

import Theming
import Localization

class CategoryViewModel: ObservableObject {
    enum Category: String, CaseIterable {
        case characters
        case locations
        case episodes

        var appImage: AppImage {
            switch self {
            case .characters:
                return .category(image: .characters)
            case .locations:
                return .category(image: .locations)
            case .episodes:
                return .category(image: .episodes)
            }
        }

        var localizedAppKey: AppLocalizationKey {
            switch self {
            case .characters:
                return .categoryCharacters
            case .locations:
                return .categoryLocations
            case .episodes:
                return .categoryEpisodes
            }
        }
    }

    @Published private(set) var categories: [Category] = Category.allCases
}
