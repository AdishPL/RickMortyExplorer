//
//  Utils.swift
//  Theming
//
//  Created by Adrian Kaczmarek on 11/01/2024.
//

import SwiftUI

public extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

public extension View {
    func performTask(priority: TaskPriority = .userInitiated, _ action: @escaping () async -> Void) -> some View {
        self.onAppear {
            Task(priority: priority) {
                await action()
            }
        }
    }
}
