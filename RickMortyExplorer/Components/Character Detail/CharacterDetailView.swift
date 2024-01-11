//
//  CharacterDetailView.swift
//  RickMortyExplorer
//
//  Created by Adrian Kaczmarek on 10/01/2024.
//

import SwiftUI
import Networking
import Theming

struct CharacterDetailView: View {
    private let viewModel: CharacterDetailViewModel

    init(viewModel: CharacterDetailViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            Color(.BackgroundDefault)
                .ignoresSafeArea()
            VStack {
                AsyncImage(
                    url: viewModel.character.image) {
                        ProgressView().progressViewStyle(.circular)
                    }
                    .aspectRatio(1, contentMode: .fit)
                    .cornerRadius(20)
                ForEach(viewModel.descriptiveFields.sorted(by: >), id:\.key) { key, value in
                    HStack {
                        Text(key + ":")
                            .styledToTypography(.subtitle1)
                            .foregroundColor(.TextPrimary)
                        Text(value)
                            .styledToTypography(.body)
                            .foregroundColor(.Neutral0)
                        Spacer()
                    }.padding()
                }
                Spacer()
            }       
            .padding()
        }
        .navigationTitle(viewModel.character.name)
    }
}
