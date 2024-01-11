//
//  CharacterFilteringViewModel.swift
//  RickMortyExplorer
//
//  Created by Adrian Kaczmarek on 11/01/2024.
//

import SwiftUI

class CharacterFilteringViewModel: ObservableObject {
    @Published var currentFilters = CharacterFilters()
    @Binding private var selectedFilters: CharacterFilters

    init(previouslySelectedFilters: Binding<CharacterFilters>) {
        self._selectedFilters = previouslySelectedFilters
        self.currentFilters = previouslySelectedFilters.wrappedValue
    }

    func applyFiltering() {
        _selectedFilters.wrappedValue = currentFilters
    }

    func toggleSelection<T: Hashable>(option: T, currentSelection: Binding<T?>) {
        if currentSelection.wrappedValue == option {
            currentSelection.wrappedValue = nil
        } else {
            currentSelection.wrappedValue = option
        }
    }
}
