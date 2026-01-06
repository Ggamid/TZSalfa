//
//  DoctorForPreview.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 06.01.2026.
//

import Foundation

extension Doctor {
    static let example: Doctor = .init(
        id: "doctor-preview-1",
        firstName: "Daria",
        patronymic: "Sergeevna",
        lastName: "Semenova",
        genderLabel: "Female",
        specialization: [
            Specialization(id: 1, name: "Pediatrician", isModerated: true),
            Specialization(id: 2, name: "Allergist", isModerated: true)
        ],
        seniority: 12,
        textChatPrice: 400,
        videoChatPrice: 600,
        homePrice: 0,
        hospitalPrice: 0,
        avatar: "https://images.unsplash.com/photo-1537368910025-700350fe46c7?auto=format&fit=crop&w=400&q=80",
        nearestReceptionTime: 1_701_000_000,
        educationTypeLabel: EducationType(id: 1, name: "Sechenov University"),
        higherEducation: [
            HigherEducation(id: 1, university: "First Moscow State Medical University")
        ],
        workExpirience: [
            WorkExperience(id: 1, organization: "City Clinic No. 5")
        ],
        rank: 1,
        category: 3,
        categoryLabel: "Top category",
        isFavorite: true
    )
}
