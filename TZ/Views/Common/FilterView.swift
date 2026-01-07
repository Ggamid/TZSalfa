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
            ForEach(DoctorFilter.allCases, id: \.self) { filter in
                filterButton(filter)
                    .overlay(
                        divider(for: filter),
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
    func filterButton(_ filter: DoctorFilter) -> some View {
        Button {
            withAnimation {
                selected = filter                
            }
        } label: {
            filterButtonLabel(by: filter)
        }
        .buttonStyle(.plain)
        .clipShape(RoundedCorners(for: filter))
    }
    
    @ViewBuilder
    func filterButtonLabel(by filter: DoctorFilter) -> some View {
        Text(filter.title)
            .font(.system(size: 18, weight: .regular))
            .foregroundColor(selected == filter ? .white : .appTextSecondary)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                selected == filter
                ? Color.appPink
                : Color.clear
            )
    }

    @ViewBuilder
    func divider(for filter: DoctorFilter) -> some View {
        if filter != DoctorFilter.allCases.last {
            Rectangle()
                .fill(Color.appCardBorder)
                .frame(width: 1)
                .padding(.vertical, 10)
        }
    }
}

// Helper to round only left/right edges for selected button
private struct RoundedCorners: Shape {
    let corners: UIRectCorner
    let radius: CGFloat

    init(for filter: DoctorFilter, radius: CGFloat = 10) {
        switch filter {
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
    StatefulPreviewWrapper(DoctorFilter.price) { selection in
        FilterView(selected: selection)
            .padding()
            .background(Color.appBackground)
    }
}
