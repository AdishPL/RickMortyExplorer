//
//  AppTheme.swift
//  Theming
//
//  Created by Adrian Kaczmarek on 11/01/2024.
//

import Foundation

public final class AppTheme {
    public static var current: any AppStyle {
        return DefaultAppStyle()
    }
}
