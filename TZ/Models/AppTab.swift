//
//  AppTab.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 07.01.2026.
//

import SwiftUI

enum AppTab: CaseIterable {
    case home, calendar, chat, profile

    var title: String {
        switch self {
        case .home: return "Главная"
        case .calendar: return "Приёмы"
        case .chat: return "Чат"
        case .profile: return "Профиль"
        }
    }

    var imageName: ImageResource {
        switch self {
        case .home: return .appHouse
        case .calendar: return .appCalendar
        case .chat: return .appChat
        case .profile: return .appProfile
        }
    }
}
