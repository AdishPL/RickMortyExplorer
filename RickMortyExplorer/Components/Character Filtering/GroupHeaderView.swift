//
//  GroupHeaderView.swift
//  RickMortyExplorer
//
//  Created by Adrian Kaczmarek on 10/01/2024.
//

import SwiftUI
import Theming

extension CharactersFilteringView {
    struct GroupHeaderView<Content: View, T: Hashable>: View {
        @Binding var selectedOption: T?

        private let title: String
        private let content: Content

        init(title: String, selectedOption: Binding<T?>, @ViewBuilder content: () -> Content) {
            self.title = title
            self._selectedOption = selectedOption
            self.content = content()
        }

        var body: some View {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text(title)
                        .styledToTypography(.largeBody)
                        .foregroundColor(.TextPrimary)
                    Spacer()
                    Button(action: {
                        selectedOption = nil
                    }) {
                        Text(.filterReset)
                            .styledToTypography(.largeBody)
                            .foregroundColor(selectedOption != nil ? Color(.Error) : Color(.Error).opacity(0.5))
                    }
                    .disabled(selectedOption == nil)
                }
                content
            }
        }
    }
}
