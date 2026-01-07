//
//  DoctorFilter.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 07.01.2026.
//

import Foundation

enum DoctorFilter: CaseIterable {
    case price
    case experience
    case rating

    var title: String {
        switch self {
        case .price: return "По цене ↓"
        case .experience: return "По стажу"
        case .rating: return "По рейтингу"
        }
    }
}
