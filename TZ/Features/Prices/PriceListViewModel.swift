//
//  PricesViewModel.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 06.01.2026.
//

import SwiftUI

@Observable
final class PricesViewModel {
    let doctor: Doctor

    init(doctor: Doctor) {
        self.doctor = doctor
    }

    var navigationTitle: String { "Стоимость услуг" }

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

extension PricesViewModel {
    struct PriceItem: Identifiable {
        let id = UUID()
        let title: String
        let subtitle: String
        let value: Int

        var formattedValue: String { "\(value) ₽" }
    }
}
