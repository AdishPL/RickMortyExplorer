//
//  EmptyResponseView.swift
//  Theming
//
//  Created by Adrian Kaczmarek on 10/01/2024.
//

import SwiftUI

public struct EmptyResponseView: View {
    public init() { }
    
    public var body: some View {
        Image(appImage: .edgeCase(image: .emptyResponse))
            .resizable()
            .scaledToFit()
            .overlay(
                Text("Look, Morty!\nThere's nothing there")
                    .styledToTypography(.display1)
                    .foregroundColor(.TextPrimary)
                    .multilineTextAlignment(.center)
                    .offset(y: 50),
                alignment: .bottom
            )
    }
}
