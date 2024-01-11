//
//  OptionRowView.swift
//  RickMortyExplorer
//
//  Created by Adrian Kaczmarek on 10/01/2024.
//

import SwiftUI
import Theming

extension CharactersFilteringView {
    struct OptionRowView: View {
        private let text: String
        private let isSelected: Bool
        private let action: () -> Void
        
        init(text: String, isSelected: Bool, action: @escaping () -> Void) {
            self.text = text
            self.isSelected = isSelected
            self.action = action
        }

        var body: some View {
            Button(action: {
                action()
            }) {
                HStack {
                    Image(systemName: isSelected ? "circle.fill" : "circle")
                        .background(isSelected ? Color(.TextPrimary) : Color(.Neutral0))
                        .foregroundColor(isSelected ? .TextPrimary : .Neutral0)
                        .imageScale(.medium)
                        .clipShape(Circle())

                    Text(text)
                        .styledToTypography(.body)
                        .padding(.leading, 8)
                        .foregroundColor(isSelected ? .TextPrimary : .Neutral0)
                }
            }
        }
    }
}
