//
//  PricesView.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 06.01.2026.
//

import SwiftUI

struct PricesView: View {
    @State var viewModel: PricesViewModel
    @Environment(\.dismiss) private var dismiss

    init(doctor: Doctor) {
        _viewModel = State(initialValue: PricesViewModel(doctor: doctor))
    }

    var body: some View {
        mainContainer
    }
}

private extension PricesView {
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
        NavBarView(
            title: viewModel.navigationTitle,
            showBack: true,
            backAction: { dismiss() }
        )
    }

    var content: some View {
        ScrollView {
            priceList
        }
    }

    var priceList: some View {
        VStack(alignment: .leading, spacing: 24) {
            ForEach(viewModel.priceItems) { item in
                PriceBlockView(item: item)
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 24)
    }
}

private struct PriceBlockView: View {
    let item: PricesViewModel.PriceItem

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            title
            PriceCardView(
                leftText: item.subtitle,
                rightText: item.formattedValue,
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
