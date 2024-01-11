//
//  CategoryListView.swift
//  RickMortyExplorer
//
//  Created by Adrian Kaczmarek on 05/01/2024.
//

import SwiftUI
import Combine
import Networking
import Theming
import Localization

struct CategoryListView: View {
    @StateObject private var categoryViewModel: CategoryViewModel

    init(categoryViewModel: CategoryViewModel) {
        self._categoryViewModel = .init(wrappedValue: categoryViewModel)
    }

    var body: some View {
        NavigationView {
            GeometryReader { metrics in
                ZStack {
                    Color(.BackgroundDefault)
                        .ignoresSafeArea()
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            Group {
                                ForEach(categoryViewModel.categories, id: \.rawValue) { category in
                                    NavigationLink(destination: destination(for: category)) {
                                        CategoryCardView(category: category)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                            .padding(.horizontal)
                            .frame(height: metrics.size.height * 0.28)
                        }
                    }
                    .padding([.top])
                }
            }
            .navigationTitle(.categoryTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
        .accentColor(Color(.TextPrimary))

    }

    private func destination(for category: CategoryViewModel.Category) -> some View {
        switch category {
        case .characters:
            return CharacterListView(viewModel: CharacterListViewModel())
        case .locations:
            return CharacterListView(viewModel: CharacterListViewModel())
        case .episodes:
            return CharacterListView(viewModel: CharacterListViewModel())
        }
    }
}
