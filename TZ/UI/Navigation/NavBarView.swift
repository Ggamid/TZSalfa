//
//  NavBarView.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 07.01.2026.
//

import SwiftUI

struct NavBarView: View {
    var title: String
    var showBack: Bool = false
    var backAction: (() -> Void)?

    var body: some View {
        HStack {
            if showBack {
                backButton
            } else {
                Spacer()
                    .frame(width: 24)
            }

            navTitle

            Spacer()
                .frame(width: 24)
        }
        .padding(.horizontal, 16)
        .frame(height: 48)
        .background(Color.appBackground)
    }
}

private extension NavBarView {
    var backButton: some View {
        Button { backAction?() } label: {
            Image(systemName: "chevron.left")
                .resizable()
                .scaledToFit()
                .frame(width: 10, height: 18)
                .foregroundColor(.appTextSecondary)
        }
        .buttonStyle(.plain)
    }
    
    var navTitle: some View {
        Text(title)
            .frame(maxWidth: .infinity)
            .font(.system(size: 24, weight: .regular))
            .foregroundColor(.appTextPrimary)
    }
}

#Preview {
    VStack(spacing: 0) {
        NavBarView(title: "Педиатр", showBack: true)
        NavBarView(title: "Педиатры")
    }
    .background(Color.appBackground)
}
