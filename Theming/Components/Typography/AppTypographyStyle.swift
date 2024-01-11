//
//  AppTypographyStyle.swift
//  Theming
//
//  Created by Adrian Kaczmarek on 11/01/2024.
//

import SwiftUI

public struct AppTypographyStyle: Equatable {
    public let uiFont: UIFont
    public let font: Font
    public let letterSpacing: Double
    public let lineSpacing: Double
    public var lineHeight: Double {
        return size + lineSpacing
    }
    public var size: Double {
        return uiFont.pointSize
    }

    public init(uiFont: UIFont, letterSpacing: Double, lineSpacing: Double) {
        self.uiFont = uiFont
        self.font = Font(uiFont)
        self.letterSpacing = letterSpacing
        self.lineSpacing = lineSpacing
    }

    public init(uiFont: UIFont, letterSpacingPercent: Double, lineHeight: Double) {
        assert(letterSpacingPercent >= -100 && letterSpacingPercent <= 100, "Letter spacing has to be specified as percentage")

        let letterSpace: Double = (uiFont.pointSize * letterSpacingPercent) / 100.0
        let lineSpace: Double = lineHeight - uiFont.pointSize
        self.init(uiFont: uiFont, letterSpacing: letterSpace, lineSpacing: lineSpace)
    }
}
