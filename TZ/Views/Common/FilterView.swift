//
//  FilterView.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 06.01.2026.
//

import SwiftUI

struct FilterView: View {
    @Binding var selected: DoctorFilter

    var body: some View {
        content
    }
}

private extension FilterView {
    var content: some View {
        HStack(spacing: 0) {
            ForEach(DoctorFilter.Category.allCases, id: \.self) { category in
                filterButton(category)
                    .overlay(
                        divider(for: category),
                        alignment: .trailing
                    )
            }
        }
        .frame(height: 32)
        .background(
            background
        )
    }
    
    var background: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(Color.appCardBorder, lineWidth: 1)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.appCardBackground)
            )
    }

    @ViewBuilder
    func filterButton(_ category: DoctorFilter.Category) -> some View {
        Button {
            withAnimation {
                if selected.category == category {
                    selected = selected.toggled()
                } else {
                    selected = DoctorFilter.defaultFor(category)
                }
            }
        } label: {
            filterButtonLabel(for: category)
        }
        .buttonStyle(.plain)
        .clipShape(RoundedCornersShape(corners: roundedCorners(for: category)))
    }
    
    @ViewBuilder
    func filterButtonLabel(for category: DoctorFilter.Category) -> some View {
        let isSelected = selected.category == category
        Text(title(for: category))
            .font(.system(size: 14, weight: .regular))
            .foregroundColor(isSelected ? .white : .appTextSecondary)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                isSelected
                ? Color.appPink
                : Color.clear
            )
    }

    @ViewBuilder
    func divider(for category: DoctorFilter.Category) -> some View {
        if category != DoctorFilter.Category.allCases.last {
            Rectangle()
                .fill(Color.appCardBorder)
                .frame(width: 1)
                .padding(.vertical, 10)
        }
    }

    func title(for category: DoctorFilter.Category) -> String {
        let baseTitle: String
        switch category {
        case .price: baseTitle = "По цене"
        case .experience: baseTitle = "По стажу"
        case .rating: baseTitle = "По рейтингу"
        }

        guard selected.category == category else { return baseTitle }
        let arrow = selected.isAscending ? "↑" : "↓"
        return "\(baseTitle) \(arrow)"
    }

    func roundedCorners(for category: DoctorFilter.Category) -> UIRectCorner {
        switch category {
        case .price:
            return [.topLeft, .bottomLeft]
        case .rating:
            return [.topRight, .bottomRight]
        default:
            return []
        }
    }
}

#Preview {
    StatefulPreviewWrapper(DoctorFilter.priceAsc) { selection in
        FilterView(selected: selection)
            .padding()
            .background(Color.appBackground)
    }
}
