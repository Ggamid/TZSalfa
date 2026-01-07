//
//  RemoteAvatarView.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 06.01.2026.
//

import SwiftUI

struct RemoteAvatarView: View {
    let urlString: String?
    var size: CGFloat = 56

    var body: some View {
        Group {
            if let urlString, let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    placeholder
                }
            } else {
                placeholder
            }
        }
        .frame(width: size, height: size)
        .clipShape(Circle())
    }

    private var placeholder: some View {
        Circle()
            .fill(Color.appControlBackground)
            .overlay(
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(Color.appHeartInactive)
                    .padding(size * 0.2)
            )
    }
}

#Preview {
    VStack(spacing: 16) {
        RemoteAvatarView(urlString: Doctor.example.avatar)
        RemoteAvatarView(urlString: nil)
    }
    .padding()
}
