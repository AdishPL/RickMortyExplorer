//
//  CharacterListView.swift
//  RickMortyExplorer
//
//  Created by Adrian Kaczmarek on 10/01/2024.
//

import SwiftUI
import Theming
import Networking
import Localization

struct CharacterListView: View {
    @State var isFilterTapped = false
    @StateObject var viewModel: CharacterListViewModel

    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ZStack {
            Color(.BackgroundDefault)
                .ignoresSafeArea()
            switch viewModel.displayState {
            case .loading:
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color(.TextPrimary)))
                    .scaleEffect(2, anchor: .center)
                    .performTask {
                        await viewModel.getCharacters()
                    }
            case .emptyResponse:
                EmptyResponseView()
            case .displayCharacters(let filteredCharacters):
                display(characters: filteredCharacters)
            }
        }
        .navigationTitle(.charactersTitle)
        .toolbar {
            ToolbarItem {
                Button(action: {
                    isFilterTapped.toggle()
                }) {
                    Image(appImage: .characterList(image: .filter))
                        .resizable()
                        .frame(width: 25, height: 25)
                }
            }
        }
    }

    private func display(characters: [Character]) -> some View {
        VStack {
            SearchBar(text: $viewModel.searchTerm, 
                      backgroundColor: Color(.BackgroundSurface),
                      placeholderText: LocalizedString(key: .charactersPlaceholderText).value,
                      foregroundColor: Color(.Neutral0),
                      iconsColor: .gray
            )
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: gridItems, spacing: 14) {
                    ForEach(characters, id: \.id) { character in
                        NavigationLink(destination: CharacterDetailView(viewModel: CharacterDetailViewModel(character: character))) {
                            CharacterListCardView(character: character)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isFilterTapped) {
            CharactersFilteringView(
                isPresented: $isFilterTapped,
                viewModel: CharacterFilteringViewModel(
                    previouslySelectedFilters: $viewModel.selectedFilters
                )
            )
        }
    }
}
