//
//  Doctor.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 06.01.2026.
//

import Foundation

struct DoctorsResponse: Decodable {
    let count: Int
    let previous: String?
    let message: String
    let errors: String?
    let data: DoctorsData
}

struct DoctorsData: Decodable {
    let users: [Doctor]
}

struct Doctor: Decodable, Identifiable {
    let id: String
    let firstName: String
    let patronymic: String?
    let lastName: String
    let genderLabel: String?
    let specialization: [Specialization]
    let seniority: Int
    let textChatPrice: Int
    let videoChatPrice: Int
    let homePrice: Int
    let hospitalPrice: Int
    let avatar: String?
    let nearestReceptionTime: TimeInterval?
    let educationTypeLabel: EducationType?
    let higherEducation: [HigherEducation]
    let workExpirience: [WorkExperience]
    let rank: Int
    let category: Int
    let categoryLabel: String?
    let isFavorite: Bool

    var doctorFullName: String {
        "\(firstName) \(patronymic ?? "") \(lastName)"
    }
    
    var doctorSpecializations: String {
        "\(specialization.map(\.name).joined(separator: ", "))"
    }
    
    var minServicePrice: Int {
        min(textChatPrice, videoChatPrice, homePrice, hospitalPrice)
    }
}
