//
//  CharacterDetailViewModel.swift
//  RickMortyExplorer
//
//  Created by Adrian Kaczmarek on 11/01/2024.
//

import Networking
import Localization

struct CharacterDetailViewModel {
    let character: Character

    var descriptiveFields: [String: String] {
        return [
            LocalizedString(key: .characterDetailName).value : character.name,
            LocalizedString(key: .characterDetailStatus).value : character.status,
            LocalizedString(key: .characterDetailSpecies).value : character.species,
            LocalizedString(key: .characterDetailGender).value : character.gender
        ]
    }

    init(character: Character) {
        self.character = character
    }
}
