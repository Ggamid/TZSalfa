//
//  DoctorDetailViewModel.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 06.01.2026.
//

import SwiftUI

@Observable
final class DoctorDetailViewModel {
    let doctor: Doctor

    init(doctor: Doctor) {
        self.doctor = doctor
    }

    var navigationTitle: String { "Педиатр" }
    var fullName: String { doctor.doctorFullName }
    var priceSummary: String { "от \(doctor.minServicePrice) ₽" }
    var actionTitle: String { "Записаться" }

    var infoRows: [InfoRow] {
        [
            InfoRow(icon: .appSeniority, text: "Опыт работы: \(doctor.seniority) лет"),
            InfoRow(icon: .appDoctorCategory, text: doctor.categoryDescription),
            InfoRow(icon: .appEducation, text: doctor.lastEducation),
            InfoRow(icon: .appWork, text: doctor.lastWorkExperience)
        ]
        .filter { !$0.text.isEmpty }
    }

    var descriptionText: String {
        """
Проводит диагностику и лечение терапевтических больных.
Осуществляет расшифровку и снятие ЭКГ.
Даёт рекомендации по диетологии.
Доктор имеет опыт работы в России и зарубежом.
Проводит консультации пациентов на английском языке.
"""
    }
}

extension DoctorDetailViewModel {
    struct InfoRow: Identifiable {
        let id = UUID()
        let icon: ImageResource
        let text: String
    }
}
