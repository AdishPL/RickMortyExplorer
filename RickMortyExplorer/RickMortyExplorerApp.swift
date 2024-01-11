//
//  RickMortyExplorerApp.swift
//  RickMortyExplorer
//
//  Created by Adrian Kaczmarek on 05/01/2024.
//

import SwiftUI
import Theming

@main
struct RickMortyExplorerApp: App {
    init() {
        AppTheme.current.apply()
    }

    var body: some Scene {
        WindowGroup {
            CategoryListView(categoryViewModel: CategoryViewModel())
        }
    }
}
