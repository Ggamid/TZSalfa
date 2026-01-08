//
//  PriceCardView.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 07.01.2026.
//

import SwiftUI

struct PriceCardView: View {
    enum Style {
        case summary
        case row
    }

    let leftText: String
    let rightText: String
    var style: Style = .row

    var body: some View {
        HStack {
            leftTextView

            Spacer()

            rightTextView
        }
        .padding()
        .frame(height: 56)
        .roundedBorder()
    }
    
    var leftTextView: some View {
        Text(leftText)
            .font(leftFont)
            .foregroundColor(.appTextPrimary)
    }
    
    var rightTextView: some View {
        Text(rightText)
            .font(.system(size: 18, weight: .semibold))
            .foregroundColor(.appTextPrimary)
    }
}

private extension PriceCardView {
    var leftFont: Font {
        switch style {
        case .summary:
            return .system(size: 18, weight: .semibold)
        case .row:
            return .system(size: 16, weight: .regular)
        }
    }
}

#Preview {
    VStack(spacing: 16) {
        PriceCardView(leftText: "Стоимость услуг", rightText: "от 600 ₽", style: .summary)
        PriceCardView(leftText: "30 мин", rightText: "600 ₽", style: .row)
    }
    .padding()
    .background(Color.appBackground)
}
