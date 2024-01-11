//
//  ImageResolver.swift
//  Theming
//
//  Created by Adrian Kaczmarek on 11/01/2024.
//

import SwiftUI

public protocol ImageResolver {
    func resolveImage(for appImage: AppImage, in bundle: Bundle) -> Image?
}

public extension ImageResolver {
    subscript(appImage: AppImage) -> Image? {
        return resolveImage(for: appImage, in: ThemingModuleBundle)
    }
}

public extension Image {
    init(appImage: AppImage) {
        let appImage = AppTheme.current.images[appImage]
        assert(appImage != nil, "\(String(describing: appImage)) couldn't be found")

        self = appImage!
    }
}

