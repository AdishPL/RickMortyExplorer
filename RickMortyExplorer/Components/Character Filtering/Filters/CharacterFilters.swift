//
//  CharacterFilters.swift
//  RickMortyExplorer
//
//  Created by Adrian Kaczmarek on 11/01/2024.
//

import Foundation

struct CharacterFilters: Hashable {
    var selectedStatus: StatusFilter?
    var selectedGender: GenderFilter?
}
