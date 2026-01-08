//
//  TabBarItemView.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 07.01.2026.
//

import SwiftUI

struct TabBarItem: View {
    let tab: AppTab
    let isSelected: Bool
    let badge: Int?
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            content
        }
        .buttonStyle(.plain)
    }
}

private extension TabBarItem {
    var content: some View {
        VStack(spacing: 6) {
            iconWithBadge
            titleLabel
        }
        .frame(maxWidth: .infinity)
    }

    var iconWithBadge: some View {
        ZStack(alignment: .topTrailing) {
            icon
            badgeView
        }
    }

    var icon: some View {
        Image(tab.imageName)
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(width: 28, height: 28)
            .foregroundStyle(isSelected ? Color.appPink : Color.appTabInactive)
    }

    @ViewBuilder
    var badgeView: some View {
        if let badge, badge > 0, tab == .chat {
            Text("\(badge)")
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.white)
                .frame(width: 20, height: 20)
                .background(Color.appPink)
                .clipShape(Circle())
                .background {
                    Circle()
                        .foregroundStyle(.white)
                        .scaleEffect(1.2)
                }
                .offset(x: 6, y: -4)
        }
    }

    var titleLabel: some View {
        Text(tab.title)
            .font(.system(size: 16))
            .foregroundColor(isSelected ? .appPink : .appTabInactive)
    }
}
