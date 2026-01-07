//
//  DoctorListView.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 06.01.2026.
//

import SwiftUI

struct DoctorListView: View {
    
    @StateObject var viewModel: DoctorListViewModel = DoctorListViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.doctors, id: \.id) { doctor in
                DoctorListCellView(doctor: doctor)
            }
        }
        .padding(.horizontal)
        .background(Color.appBackground)
        .onAppear {
            viewModel.getDoctorList()
        }
    }
}

#Preview {
    DoctorListView()
}
