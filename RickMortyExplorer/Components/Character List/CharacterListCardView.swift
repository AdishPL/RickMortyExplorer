//
//  CharacterListCardView.swift
//  RickMortyExplorer
//
//  Created by Adrian Kaczmarek on 11/01/2024.
//

import SwiftUI
import Theming
import Networking

struct CharacterListCardView: View {
    private let character: Character

    init(character: Character) {
        self.character = character
    }

    var body: some View {
        AsyncImage(
            url: character.image) {
                ProgressView().progressViewStyle(.circular)
            }
            .frame(height: 200)
            .aspectRatio(1, contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                Rectangle()
                    .frame(height: 50)
                    .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                    .foregroundColor(.BackgroundOverlay)
                    .overlay(
                        Text(character.name)
                            .styledToTypography(.subtitle1)
                            .foregroundColor(.TextSecondary)
                            .minimumScaleFactor(0.4)
                            .lineLimit(1)
                            .padding(.horizontal)
                    ),
                alignment: .bottom
            )
    }
}
