//
//  RoundedCornersShape.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 07.01.2026.
//

import SwiftUI

struct RoundedCornersShape: Shape {
    let corners: UIRectCorner
    let radius: CGFloat

    init(corners: UIRectCorner = [], radius: CGFloat = 10) {
        self.corners = corners
        self.radius = radius
    }

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
