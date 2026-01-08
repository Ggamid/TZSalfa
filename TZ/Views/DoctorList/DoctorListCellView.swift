//
//  DoctorListCellView.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 06.01.2026.
//

import SwiftUI

struct DoctorListCellView: View {
    
    let doctor: Doctor
    
    private var hasSchedule: Bool { doctor.nearestReceptionTime != nil }
    private var buttonTitle: String {
        hasSchedule ? "Записаться" : "Нет свободного расписания"
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            header
            PrimaryButton(title: buttonTitle, isEnabled: hasSchedule) { }
        }
        .padding(16)
        .roundedBorder()
    }
}

private extension DoctorListCellView {
    
    var header: some View {
        HStack(alignment: .top, spacing: 12) {
            RemoteAvatarView(urlString: doctor.avatar, size: 56)
                .frame(maxHeight: .infinity, alignment: .top)
            
            VStack(alignment: .leading, spacing: 8) {
                nameView
                ratingView
                specializationView
                priceView
            }
            
            Spacer(minLength: 8)
            
            FavoriteButton(isActive: doctor.isFavorite) { }
                .frame(maxHeight: .infinity, alignment: .top)
        }
    }
    
    var nameView: some View {
        Text(doctor.doctorFullName)
            .font(.system(size: 18, weight: .semibold))
            .foregroundColor(.appTextPrimary)
            .multilineTextAlignment(.leading)
            .lineLimit(2)
    }
    
    var ratingView: some View {
        RatingView(
            rating: doctor.rank,
            filledColor: .appStarFilled,
            emptyColor: .appStarEmpty,
            size: 14
        )
    }
    
    var specializationView: some View {
        Text("\(doctor.doctorSpecializations) · стаж \(doctor.seniority) лет")
            .font(.system(size: 14))
            .foregroundColor(.appTextSecondary)
    }
    
    var priceView: some View {
        Text("от \(doctor.minServicePrice) ₽")
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.appTextPrimary)
    }
}

#Preview {
    ScrollView {
        DoctorListCellView(doctor: Doctor.example)
            .padding()
    }
    .background(Color.appBackground)
}
