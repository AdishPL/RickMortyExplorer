//
//  Utils.swift
//  Localization
//
//  Created by Adrian Kaczmarek on 11/01/2024.
//

import SwiftUI

public extension View {
    func navigationTitle(_ appLocalizedKey: AppLocalizationKey) -> some View {
        navigationTitle(LocalizedString(key: appLocalizedKey).value)
    }
}

public extension Text {
    init(_ appLocalizedKey: AppLocalizationKey) {
        self = Text(LocalizedString(key: appLocalizedKey).value)
    }
}
