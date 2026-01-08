//
//  RatingView.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 06.01.2026.
//

import SwiftUI

struct RatingView: View {
    let rating: Int
    let max: Int
    let filledColor: Color
    let emptyColor: Color
    let size: CGFloat

    init(
        rating: Int,
        max: Int = 5,
        filledColor: Color = Color.appStarFilled,
        emptyColor: Color = Color.appStarEmpty,
        size: CGFloat = 16
    ) {
        self.rating = rating
        self.max = max
        self.filledColor = filledColor
        self.emptyColor = emptyColor
        self.size = size
    }

    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<max, id: \.self) { index in
                let descriptor = starDescriptor(for: index)
                Image(systemName: descriptor.systemName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
                    .foregroundStyle(descriptor.color)
                    .accessibilityLabel(Text("Star \(index + 1) of \(max)"))
            }
        }
    }
}

private extension RatingView {
    enum StarType {
        case full, empty

        var systemName: String {
            switch self {
            case .full: return "star.fill"
            case .empty: return "star"
            }
        }
    }

    func starDescriptor(for index: Int) -> (systemName: String, color: Color) {
        let value = rating - index
        let star: StarType

        switch value {
        case let xVar where xVar >= 1:
            star = .full
        default:
            star = .empty
        }

        let color = star == .empty ? emptyColor : filledColor
        return (star.systemName, color)
    }
}

#Preview {
    VStack(alignment: .leading, spacing: 12) {
        RatingView(rating: 4)
        RatingView(rating: 3)
        RatingView(rating: 5)
        RatingView(rating: 1)
    }
    .padding()
}
