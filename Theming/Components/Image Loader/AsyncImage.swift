//
//  AsyncImage.swift
//  Theming
//
//  Created by Adrian Kaczmarek on 10/01/2024.
//

import Combine
import SwiftUI

public struct AsyncImage<Placeholder: View>: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: Placeholder

    public init(url: URL, @ViewBuilder placeholder: () -> Placeholder) {
        self.placeholder = placeholder()
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
    }

    public var body: some View {
        content
            .onAppear(perform: loader.load)
    }

    private var content: some View {
        Group {
            if let loadedImage = loader.image {
                Image(uiImage: loadedImage)
                    .resizable()
            } else {
                placeholder
            }
        }
    }
}
