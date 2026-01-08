//
//  PrimaryButton.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 06.01.2026.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    var isEnabled: Bool = true
    var action: () -> Void

    var body: some View {
        Button {
            if isEnabled {
                action()
            }
        } label: {
            Text(title)
                .font(.system(size: 18, weight: .semibold))
                .frame(maxWidth: .infinity)
                .frame(height: 52)
                .foregroundColor(isEnabled ? .white : .appButtonDisabledText)
                .background(isEnabled ? Color.appPink : Color.appButtonDisabled)
                .cornerRadius(12)
        }
        .buttonStyle(.plain)
        .disabled(!isEnabled)
    }
}

#Preview {
    VStack(spacing: 16) {
        PrimaryButton(title: "Записаться") { }
        PrimaryButton(title: "Нет свободного расписания", isEnabled: false) { }
    }
    .padding()
    .background(Color.appBackground)
}
