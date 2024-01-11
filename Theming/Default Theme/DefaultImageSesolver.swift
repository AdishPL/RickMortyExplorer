//
//  DefaultImageSesolver.swift
//  Theming
//
//  Created by Adrian Kaczmarek on 11/01/2024.
//

import SwiftUI

public struct DefaultImageSesolver: ImageResolver {
    public func resolveImage(for appImage: AppImage,
                             in bundle: Bundle = ThemingModuleBundle) -> Image? {
        switch appImage {
        case .category(let image):
            return categoryImage(for: image)
        case .edgeCase(let image):
            switch image {
            case .emptyResponse:
                return Image("rickmortynothing", bundle: ThemingModuleBundle)
            }
        case .characterList(let image):
            switch image {
            case .filter:
                return Image("filterIcon", bundle: ThemingModuleBundle)
            }
        }
    }

    // MARK: - Category
    private func categoryImage(for image: CategoryImage) -> Image? {
        switch image {
        case .characters:
            return Image("charactersImage", bundle: ThemingModuleBundle)
        case .locations:
            return Image("locationsImage", bundle: ThemingModuleBundle)
        case .episodes:
            return Image("episodesImage", bundle: ThemingModuleBundle)
        }
    }
}
