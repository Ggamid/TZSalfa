//
//  DoctorFilter.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 07.01.2026.
//

import Foundation

enum DoctorFilter: CaseIterable {
    case priceAsc
    case priceDesc
    case experienceAsc
    case experienceDesc
    case ratingAsc
    case ratingDesc

    enum Category: CaseIterable {
        case price, experience, rating
    }

    var category: Category {
        switch self {
        case .priceAsc, .priceDesc: return .price
        case .experienceAsc, .experienceDesc: return .experience
        case .ratingAsc, .ratingDesc: return .rating
        }
    }

    var isAscending: Bool {
        switch self {
        case .priceAsc, .experienceAsc, .ratingAsc: return true
        case .priceDesc, .experienceDesc, .ratingDesc: return false
        }
    }

    var title: String {
        switch self.category {
        case .price: return "По цене"
        case .experience: return "По стажу"
        case .rating: return "По рейтингу"
        }
    }

    func toggled() -> DoctorFilter {
        switch self {
        case .priceAsc: return .priceDesc
        case .priceDesc: return .priceAsc
        case .experienceAsc: return .experienceDesc
        case .experienceDesc: return .experienceAsc
        case .ratingAsc: return .ratingDesc
        case .ratingDesc: return .ratingAsc
        }
    }

    static func defaultFor(_ category: Category) -> DoctorFilter {
        switch category {
        case .price: return .priceAsc
        case .experience: return .experienceAsc
        case .rating: return .ratingAsc
        }
    }
}
