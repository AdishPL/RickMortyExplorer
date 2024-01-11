//
//  SearchBar.swift
//  Theming
//
//  Created by Adrian Kaczmarek on 10/01/2024.
//

import SwiftUI

public struct SearchBar: View {
    @Binding var text: String

    @State private var isEditing = false

    private let backgroundColor: Color
    private let placeholderText: String
    private let foregroundColor: Color
    private let iconsColor: Color

    public init(text: Binding<String>, 
                backgroundColor: Color,
                placeholderText: String,
                foregroundColor: Color,
                iconsColor: Color) {
        self._text = text
        self.backgroundColor = backgroundColor
        self.placeholderText = placeholderText
        self.foregroundColor = foregroundColor
        self.iconsColor = iconsColor
    }

    public var body: some View {
        HStack {
            TextField("", text: $text)
                .placeholder(when: text.isEmpty) {
                    Text(placeholderText)
                        .styledToTypography(.body)
                        .foregroundColor(iconsColor)
                }
                .padding(7)
                .padding(.horizontal, 25)
                .cornerRadius(8)
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(iconsColor)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)

                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(iconsColor)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
                .transition(.move(edge: .trailing))
                .animation(.default)

            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""

                }) {
                    Text("Cancel")
                        .styledToTypography(.body)
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

fileprivate extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
