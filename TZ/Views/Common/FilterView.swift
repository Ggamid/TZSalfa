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
        .frame(height: 44)
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
        .clipShape(RoundedCorners(for: category))
    }
    
    @ViewBuilder
    func filterButtonLabel(for category: DoctorFilter.Category) -> some View {
        let isSelected = selected.category == category
        Text(title(for: category))
            .font(.system(size: 18, weight: .regular))
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
}

// Helper to round only left/right edges for selected button
private struct RoundedCorners: Shape {
    let corners: UIRectCorner
    let radius: CGFloat

    init(for category: DoctorFilter.Category, radius: CGFloat = 10) {
        switch category {
        case .price:
            self.corners = [.topLeft, .bottomLeft]
        case .rating:
            self.corners = [.topRight, .bottomRight]
        default:
            self.corners = []
        }
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

#Preview {
    StatefulPreviewWrapper(DoctorFilter.priceAsc) { selection in
        FilterView(selected: selection)
            .padding()
            .background(Color.appBackground)
    }
}
