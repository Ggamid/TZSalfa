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
    var backAction: (() -> Void)? = nil

    var body: some View {
        HStack {
            if showBack {
                Button(action: { backAction?() }) {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 10, height: 18)
                        .foregroundColor(.appTextSecondary)
                }
                .buttonStyle(.plain)
            } else {
                // keep spacing aligned
                Spacer()
                    .frame(width: 24)
            }

            Spacer()

            Text(title)
                .font(.system(size: 24, weight: .regular))
                .foregroundColor(.appTextPrimary)

            Spacer()

            // placeholder for right side to keep centered title
            Spacer()
                .frame(width: 24)
        }
        .padding(.horizontal, 16)
        .frame(height: 48)
        .background(Color.appBackground)
    }
}

#Preview {
    VStack(spacing: 0) {
        NavBarView(title: "Педиатр", showBack: true)
        NavBarView(title: "Педиатры")
    }
    .background(Color.appBackground)
}
