//
//  AppImage.swift
//  Theming
//
//  Created by Adrian Kaczmarek on 10/01/2024.
//

import SwiftUI

public enum AppImage {
    case category(image: CategoryImage)

    case edgeCase(image: EdgeCaseImage)

    case characterList(image: CharacterListImage)
}

public enum CategoryImage {
    case characters
    case locations
    case episodes
}

public enum CharacterListImage {
    case filter
}

public enum EdgeCaseImage {
    case emptyResponse
}


public extension AppImage {
    enum CharacterList {
        case filter
    }
}
