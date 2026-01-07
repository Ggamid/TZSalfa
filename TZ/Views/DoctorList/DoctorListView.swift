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
        NavigationStack {
            VStack(spacing: 0) {
                NavBarView(title: "Педиатры", showBack: false)
                content
            }
            .toolbar(.hidden)
        }
    }
    
    var content: some View {
        VStack(spacing: 10) {
            header
            doctorsList
        }
    }
    
    var header: some View {
        Group {
            SearchBar(text: $viewModel.searchText)
            FilterView(selected: $viewModel.filter)
        }
        .padding(.horizontal)
    }
    
    var doctorsList: some View {
        ScrollView {
            ForEach(viewModel.filteredList, id: \.id) { doctor in
                NavigationLink {
                    DoctorDetailView(doctor: doctor)
                } label: {
                    DoctorListCellView(doctor: doctor)
                }
            }
            hiddenRect
        }
        .padding(.horizontal)
        .scrollIndicators(.hidden)
        .frame(maxHeight: .infinity)
        .onAppear {
            viewModel.getDoctorList()
        }
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
