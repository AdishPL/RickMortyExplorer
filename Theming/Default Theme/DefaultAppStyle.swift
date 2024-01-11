//
//  DefaultAppStyle.swift
//  Theming
//
//  Created by Adrian Kaczmarek on 11/01/2024.
//

import UIKit

final class DefaultAppStyle: AppStyle {
//    let fonts: FontResolver = VCFontResolver()
    let colors: ColorResolver = DefaultColorResolver()
    let images: ImageResolver = DefaultImageSesolver()
    let typography: TypographyResolver = DefaultTypographyResolver()

    func apply() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(AppTheme.current.colors[.TextPrimary]), .font: typography.resolveTypography(for: .display1, in: ThemingModuleBundle).uiFont]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(AppTheme.current.colors[.TextPrimary]), .font: typography.resolveTypography(for: .display1, in: ThemingModuleBundle).uiFont]
        navBarAppearance.backgroundColor = UIColor(AppTheme.current.colors[.BackgroundDefault])

        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
    }
}

extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}
