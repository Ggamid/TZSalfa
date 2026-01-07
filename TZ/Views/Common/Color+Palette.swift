//
//  Color+Palette.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 06.01.2026.
//

import SwiftUI

extension Color {
    // Brand / accent
    static let appPink = Color(red: 1.00, green: 0.31, blue: 0.55)
    static let appPinkPressed = Color(red: 0.90, green: 0.24, blue: 0.45)

    // Text
    static let appTextPrimary = Color(red: 0.10, green: 0.10, blue: 0.10)
    static let appTextSecondary = Color(red: 0.36, green: 0.36, blue: 0.36)
    static let appTextMuted = Color(red: 0.60, green: 0.60, blue: 0.60)

    // Surfaces
    static let appBackground = Color(red: 0.97, green: 0.97, blue: 0.97)
    static let appCardBackground = Color.white
    static let appCardBorder = Color(red: 0.90, green: 0.90, blue: 0.90)
    static let appControlBackground = Color(red: 0.94, green: 0.94, blue: 0.94)

    // State / icons
    static let appStarFilled = appPink
    static let appStarEmpty = Color(red: 0.70, green: 0.70, blue: 0.70)
    static let appHeartInactive = Color(red: 0.70, green: 0.70, blue: 0.70)
    static let appTabInactive = Color(red: 0.45, green: 0.45, blue: 0.45)

    // Buttons
    static let appButtonDisabled = Color(red: 0.85, green: 0.85, blue: 0.85)
    static let appButtonDisabledText = Color(red: 0.35, green: 0.35, blue: 0.35)
}
