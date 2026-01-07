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
        VStack {
            
            FilterView(selected: $viewModel.filter)
                .padding()
            
            ScrollView {
                ForEach(viewModel.filteredList, id: \.id) { doctor in
                    DoctorListCellView(doctor: doctor)
                }
            }
            .padding(.horizontal)
            .scrollIndicators(.hidden)
            .onAppear {
                viewModel.getDoctorList()
            }
        }
        .background(Color.appBackground)
    }
}

#Preview {
    DoctorListView()
}
