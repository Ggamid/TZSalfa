//
//  PricesView.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 06.01.2026.
//

import SwiftUI

struct PricesView: View {
    let doctor: Doctor
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        mainContainer
    }
}

private extension PricesView {
    struct PriceItem: Identifiable {
        let id = UUID()
        let title: String
        let subtitle: String
        let value: Int
    }

    var mainContainer: some View {
        VStack(spacing: 0) {
            navigationBar
            content
        }
        .background(Color.appBackground.ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
        .toolbarBackground(.hidden, for: .navigationBar)
        .edgeSwipeDismiss()
    }

    var navigationBar: some View {
        NavBarView(title: "Стоимость услуг", showBack: true, backAction: { dismiss() })
    }

    var content: some View {
        ScrollView {
            priceList
        }
    }

    var priceList: some View {
        VStack(alignment: .leading, spacing: 24) {
            ForEach(priceItems) { item in
                PriceBlockView(item: item)
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 24)
    }

    var priceItems: [PriceItem] {
        [
            PriceItem(
                title: "Видеоконсультация",
                subtitle: "30 мин",
                value: doctor.videoChatPrice
            ),
            PriceItem(
                title: "Чат с врачом",
                subtitle: "30 мин",
                value: doctor.textChatPrice
            ),
            PriceItem(
                title: "Приём в клинике",
                subtitle: "В клинике",
                value: doctor.hospitalPrice
            ),
            PriceItem(
                title: "Вызов на дом",
                subtitle: "На дому",
                value: doctor.homePrice
            )
        ]
        .filter { $0.value > 0 }
    }
}

private struct PriceBlockView: View {
    let item: PricesView.PriceItem

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            title
            PriceCardView(
                leftText: item.subtitle,
                rightText: "\(item.value) ₽",
                style: .row
            )
        }
    }

    private var title: some View {
        Text(item.title)
            .font(.system(size: 18, weight: .semibold))
            .foregroundColor(.appTextPrimary)
    }
}

#Preview {
    PricesView(doctor: .example)
}
