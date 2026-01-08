//
//  DoctorDetailView.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 06.01.2026.
//

import SwiftUI

struct DoctorDetailView: View {
    
    let doctor: Doctor
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            NavBarView(title: "Педиатр", showBack: true, backAction: { dismiss() })
            content
        }
        .navigationBarBackButtonHidden(true)
        .edgeSwipeDismiss()
    }
}

private extension DoctorDetailView {
    var content: some View {
        VStack(spacing: 0) {
            doctorDescription
            actionButton
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
        .background(Color.appBackground.ignoresSafeArea())
    }
    
    var doctorDescription: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                header
                infoRows
                priceCard
                descriptionSection
            }
        }
    }
    
    var header: some View {
        HStack(alignment: .center, spacing: 12) {
            RemoteAvatarView(urlString: doctor.avatar, size: 64)
            
            Text(doctor.doctorFullName)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.appTextPrimary)

            Spacer()
        }
    }
    
    var infoRows: some View {
        VStack(alignment: .leading, spacing: 16) {
            infoRow(icon: .appSeniority, text: "Опыт работы: \(doctor.seniority) лет")
            infoRow(icon: .appDoctorCategory, text: doctor.categoryDescription)
            infoRow(icon: .appEducation, text: doctor.lastEducation)
            infoRow(icon: .appWork, text: doctor.lastWorkExperience)
        }
    }
    
    func infoRow(icon: ImageResource, text: String) -> some View {
        HStack(spacing: 12) {
            Image(icon)
                .foregroundColor(.appTextMuted)
                .frame(width: 20, height: 20)
            
            Text(text)
                .font(.system(size: 16))
                .foregroundColor(.appTextSecondary)
            Spacer()
        }
    }
    
    var priceCard: some View {
        PriceCardView(
            leftText: "Стоимость услуг",
            rightText: "от \(doctor.minServicePrice) ₽",
            style: .summary
        )
    }
    
    var descriptionSection: some View {
        Text("""
Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Даёт рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке.
""")
        .font(.system(size: 16))
        .foregroundColor(.appTextPrimary)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var actionButton: some View {
        PrimaryButton(title: "Записаться") { }
            .padding(.top, 12)
    }
}

#Preview {
    DoctorDetailView(doctor: .example)
}
