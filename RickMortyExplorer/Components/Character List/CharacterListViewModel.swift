//
//  CharacterListViewModel.swift
//  RickMortyExplorer
//
//  Created by Adrian Kaczmarek on 10/01/2024.
//

import SwiftUI
import Combine
import Networking

class CharacterListViewModel: ObservableObject {
    enum DisplayState {
        case loading
        case emptyResponse
        case displayCharacters([Character])
    }

    private let searchQueue = DispatchQueue(label: "serial")

    @Published private var characterList: [Character] = []

    @Published var searchTerm = ""
    @Published private(set) var displayState: DisplayState
    @Published var selectedFilters: CharacterFilters

    private var cancellable: AnyCancellable?
    private let characterProvider: CharactersProvidable

    init(characterProvider: CharactersProvidable = CharactersProvider()) {
        self.characterProvider = characterProvider
        self._displayState = .init(initialValue: .loading)
        self._selectedFilters = .init(initialValue: CharacterFilters())

        subscribeForCharacters()
    }

    @MainActor func getCharacters() async {
        displayState = .loading
        switch await characterProvider.fetchCharacters() {
        case .success(let characters):
            characterList = characters
        case .failure(let error):
            switch error {
            case .emptyData:
                displayState = .emptyResponse
            case .invalidURL, .errorEncountered(_):
                // TODO: Proper error handling
                break
            }
        }
    }

    private func subscribeForCharacters() {
        cancellable = $searchTerm.removeDuplicates()
            .combineLatest(
                $characterList.removeDuplicates(),
                $selectedFilters.removeDuplicates()
            )
            .debounce(for: .milliseconds(500), scheduler: searchQueue)
            .compactMap { combined in
                let (searchTerm, characterList, selectedFilters) = combined

                let selectedGender = selectedFilters.selectedGender
                let selectedStatus = selectedFilters.selectedStatus

                return characterList.filter { character in
                    let nameMatch = searchTerm.isEmpty || character.name.lowercased().contains(searchTerm.lowercased())
                    let genderMatch = selectedGender == nil || character.gender == selectedGender!.rawValue
                    let statusMatch = selectedStatus == nil || character.status == selectedStatus!.rawValue
                    return nameMatch && genderMatch && statusMatch
                }
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] filteredCharacters in
                self?.displayState = .displayCharacters(filteredCharacters)
            })
    }
}
