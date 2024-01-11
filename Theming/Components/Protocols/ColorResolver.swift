//
//  ColorResolver.swift
//  Theming
//
//  Created by Adrian Kaczmarek on 11/01/2024.
//

import SwiftUI

public protocol ColorResolver {
    func resolveColor(for appColor: AppColor, in bundle: Bundle) -> Color
}

public extension ColorResolver {
    subscript(color: AppColor) -> Color {
        return resolveColor(for: color, in: ThemingModuleBundle)
    }
}

public extension View {
    func foregroundColor(_ color: AppColor) -> some View {
        foregroundColor(AppTheme.current.colors[color])
    }
}

public extension Color {
    init(_ color: AppColor) {
        self = AppTheme.current.colors[color]
    }
}
