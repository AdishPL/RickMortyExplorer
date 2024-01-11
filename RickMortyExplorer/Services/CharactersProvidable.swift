//
//  CharactersProvidable.swift
//  RickMortyExplorer
//
//  Created by Adrian Kaczmarek on 10/01/2024.
//

import Networking

protocol CharactersProvidable {
    func fetchCharacters() async -> Result<[Character], APIError>
}

struct CharactersProvider: CharactersProvidable {
    private let apiProvider: APIInterfaceProvidable

    init(apiProvider: APIInterfaceProvidable = DataService()) {
        self.apiProvider = apiProvider
    }

    func fetchCharacters() async -> Result<[Character], APIError> {
        return await apiProvider.executeRequest(.listCharactersRequest, expecting: [Character].self)
    }
}
