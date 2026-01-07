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
        VStack(spacing: 10) {
            Group {
                SearchBar(text: $viewModel.searchText)
                
                FilterView(selected: $viewModel.filter)
            }
            .padding(.horizontal)
            
            ScrollView {
                ForEach(viewModel.filteredList, id: \.id) { doctor in
                    DoctorListCellView(doctor: doctor)
                }
                hiddenRect
            }
            .padding(.horizontal)
            .scrollIndicators(.hidden)
            .onAppear {
                viewModel.getDoctorList()
            }
        }
        .background(Color.appBackground)
    }
    
    var hiddenRect: some View {
        Rectangle()
            .frame(height: 200)
            .hidden()
    }
}

#Preview {
    DoctorListView()
}
