//
//  SearchBar.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 07.01.2026.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var placeholder: String = "Поиск"

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "magnifyingglass")
                .resizable()
                .scaledToFit()
                .frame(height: 22)
                .foregroundColor(.appTextMuted)

            TextField(placeholder, text: $text)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.appTextSecondary)
        }
        .padding(.horizontal, 16)
        .frame(height: 40)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.25), lineWidth: 2)
                .background(Color.white)
        )
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    StatefulPreviewWrapper("") { text in
        SearchBar(text: text)
            .padding()
            .background(Color.appBackground)
    }
}
