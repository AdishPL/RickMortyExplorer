//
//  AppLocalizationKey.swift
//  Localization
//
//  Created by Adrian Kaczmarek on 11/01/2024.
//

import Foundation

public enum AppLocalizationKey: String {
    case categoryCharacters = "category.characters"
    case categoryLocations = "category.locations"
    case categoryEpisodes = "category.episodes"
    case categoryTitle = "category.title"

    case charactersTitle = "characters.title"
    case charactersPlaceholderText = "characters.placeholderText"

    case filterTitle = "filter.title"
    case filterStatusAlive = "filter.status.alive"
    case filterStatusDead = "filter.status.dead"
    case filterStatusUnknown = "filter.status.unknown"
    case filterStatus = "filter.status"
    case filterReset = "filter.reset"

    case filterGender = "filter.gender"
    case filterGenderFemale = "filter.gender.female"
    case filterGenderMale = "filter.gender.male"
    case filterGenderGenderless = "filter.gender.genderless"
    case filterGenderUnknown = "filter.gender.unknown"
    case filterApplyButton = "filter.applyButton"

    case characterDetailName = "character.detail.name"
    case characterDetailStatus = "character.detail.status"
    case characterDetailSpecies = "character.detail.species"
    case characterDetailGender = "character.detail.gender"
}
