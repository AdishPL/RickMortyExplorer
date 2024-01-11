//
//  DefaultColorResolver.swift
//  Theming
//
//  Created by Adrian Kaczmarek on 11/01/2024.
//

import SwiftUI

public struct DefaultColorResolver: ColorResolver {
    public func resolveColor(for appColor: AppColor, in bundle: Bundle = ThemingModuleBundle) -> Color {
        return Color(appColor.rawValue, bundle: bundle)
    }
}
