//
//  DoctorDetailView.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 06.01.2026.
//

import SwiftUI

struct DoctorDetailView: View {
    
    @State var viewModel: DoctorDetailViewModel
    @Environment(\.dismiss) private var dismiss
    
    init(doctor: Doctor) {
        _viewModel = State(initialValue: DoctorDetailViewModel(doctor: doctor))
    }

    var body: some View {
        VStack(spacing: 0) {
            NavBarView(
                title: viewModel.navigationTitle,
                showBack: true,
                backAction: { dismiss() }
            )
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
            RemoteAvatarView(urlString: viewModel.doctor.avatar, size: 64)
            
            Text(viewModel.fullName)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.appTextPrimary)

            Spacer()
        }
    }
    
    var infoRows: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(viewModel.infoRows) { row in
                infoRow(icon: row.icon, text: row.text)
            }
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
        NavigationLink {
            PricesView(doctor: viewModel.doctor)
        } label: {
            PriceCardView(
                leftText: "Стоимость услуг",
                rightText: viewModel.priceSummary,
                style: .summary
            )
        }
    }
    
    var descriptionSection: some View {
        Text(viewModel.descriptionText)
        .font(.system(size: 16))
        .foregroundColor(.appTextPrimary)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var actionButton: some View {
        PrimaryButton(title: viewModel.actionTitle) { }
            .padding(.top, 12)
    }
}

#Preview {
    DoctorDetailView(doctor: .example)
}
