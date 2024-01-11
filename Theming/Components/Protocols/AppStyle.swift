//
//  AppStyle.swift
//  Theming
//
//  Created by Adrian Kaczmarek on 11/01/2024.
//

import SwiftUI

public protocol AppStyle {
    var typography: TypographyResolver { get }
    var colors: ColorResolver { get }
    var images: ImageResolver { get }

    func apply() // used for appearance proxy if needed
}
