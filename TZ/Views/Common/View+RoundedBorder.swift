//
//  View+RoundedBorder.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 07.01.2026.
//

import SwiftUI

private struct RoundedBorderModifier: ViewModifier {
    let cornerRadius: CGFloat
    let strokeColor: Color
    let lineWidth: CGFloat
    let fillColor: Color

    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(strokeColor, lineWidth: lineWidth)
                    .background(fillColor)
            )
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

extension View {
    func roundedBorder(
        cornerRadius: CGFloat = 12,
        strokeColor: Color = .appCardBorder,
        lineWidth: CGFloat = 1,
        fillColor: Color = .appCardBackground
    ) -> some View {
        modifier(
            RoundedBorderModifier(
                cornerRadius: cornerRadius,
                strokeColor: strokeColor,
                lineWidth: lineWidth,
                fillColor: fillColor
            )
        )
    }
}
