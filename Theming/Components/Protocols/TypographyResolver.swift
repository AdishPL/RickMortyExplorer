//
//  TypographyResolver.swift
//  Theming
//
//  Created by Adrian Kaczmarek on 11/01/2024.
//

import SwiftUI

public protocol TypographyResolver {
    func resolveTypography(for typography: AppTypography, in bundle: Bundle) -> AppTypographyStyle
}

public extension Text {
    /// Applies typography styling to the text component based on theme and the provided token.
    /// Generally whenever possible the ``FPText`` should used be insted.
    /// This method is only to allow compatibility for the native Text component in other cases.
    /// It can only be applied directly to a Text component, it's not meant to be used on view containers.
    func styledToTypography(_ appTypography: AppTypography, in bundle: Bundle = ThemingModuleBundle) -> some View {
        let style = AppTheme.current.typography.resolveTypography(for: appTypography, in: bundle)

        return self.font(style.font)
            .tracking(style.letterSpacing)
            .lineSpacing(style.lineSpacing)
    }
}
