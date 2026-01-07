//
//  TabBarView.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 06.01.2026.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selected: AppTab
    var chatBadge: Int? = nil

    var body: some View {
        content
    }
}

private extension TabBarView {
    var content: some View {
        VStack(spacing: 8) {
            divider
            itemsRow
        }
        .frame(maxWidth: .infinity)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
    }

    var divider: some View {
        Divider()
            .background(Color.appCardBorder)
            .padding(.horizontal, -16)
    }

    var itemsRow: some View {
        HStack {
            ForEach(AppTab.allCases, id: \.self) { tab in
                TabBarItem(
                    tab: tab,
                    isSelected: tab == selected,
                    badge: tab == .chat ? chatBadge : nil
                ) {
                    selected = tab
                }
            }
        }
        .padding(.horizontal, 12)
        .padding(.bottom, 6)
    }
}

#Preview {
    StatefulPreviewWrapper(AppTab.home) { selection in
        VStack {
            Spacer()
            TabBarView(selected: selection, chatBadge: 1)
        }
        .background(Color.appBackground)
    }
}
