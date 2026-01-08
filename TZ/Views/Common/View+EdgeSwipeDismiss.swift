//
//  View+EdgeSwipeDismiss.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 07.01.2026.
//

import SwiftUI

private struct EdgeSwipeDismissModifier: ViewModifier {
    @Environment(\.dismiss) private var dismiss
    let edgeWidth: CGFloat
    let threshold: CGFloat
    let verticalTolerance: CGFloat

    func body(content: Content) -> some View {
        content.simultaneousGesture(
            DragGesture(minimumDistance: 20, coordinateSpace: .local)
                .onEnded { value in
                    guard value.startLocation.x < edgeWidth else { return }
                    guard value.translation.width > threshold else { return }
                    guard abs(value.translation.height) < verticalTolerance else { return }
                    dismiss()
                }
        )
    }
}

extension View {
    func edgeSwipeDismiss(
        edgeWidth: CGFloat = 24,
        threshold: CGFloat = 80,
        verticalTolerance: CGFloat = 40
    ) -> some View {
        modifier(
            EdgeSwipeDismissModifier(
                edgeWidth: edgeWidth,
                threshold: threshold,
                verticalTolerance: verticalTolerance
            )
        )
    }
}
