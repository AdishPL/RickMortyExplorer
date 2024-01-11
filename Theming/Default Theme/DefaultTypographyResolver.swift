//
//  DefaultTypographyResolver.swift
//  Theming
//
//  Created by Adrian Kaczmarek on 11/01/2024.
//

import Foundation

public struct DefaultTypographyResolver: TypographyResolver {
    public func resolveTypography(for typography: AppTypography, in bundle: Bundle) -> AppTypographyStyle {
        switch typography {
        case .display1:
            return AppTypographyStyle(uiFont: .systemFont(ofSize: 30, weight: .medium),
                                      letterSpacingPercent: -3,
                                      lineHeight: 40)
        case .body:
            return AppTypographyStyle(uiFont: .systemFont(ofSize: 16),
                                      letterSpacingPercent: 0,
                                      lineHeight: 24)
        case .largeBody:
            return AppTypographyStyle(uiFont: .systemFont(ofSize: 22),
                                      letterSpacingPercent: 0,
                                      lineHeight: 24)
        case .subtitle1:
            return AppTypographyStyle(uiFont: .systemFont(ofSize: 18, weight: .heavy),
                                      letterSpacingPercent: 0,
                                      lineHeight: 24)
        }
    }
}
