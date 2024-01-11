//
//  CategoryCardView.swift
//  RickMortyExplorer
//
//  Created by Adrian Kaczmarek on 10/01/2024.
//

import SwiftUI
import Theming
import Localization

struct CategoryCardView: View {
    private let category: CategoryViewModel.Category

    init(category: CategoryViewModel.Category) {
        self.category = category
    }

    var body: some View {
        Image(appImage: category.appImage)
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.BackgroundOverlay)
                    .clipped()
                    .opacity(0.6)
                    .overlay(
                        Text(LocalizedString(key: category.localizedAppKey).value)
                            .styledToTypography(.display1)
                            .foregroundColor(.TextSecondary)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                    )
            )
    }
}
