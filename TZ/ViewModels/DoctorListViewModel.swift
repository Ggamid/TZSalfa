//
//  DoctorListViewModel.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 06.01.2026.
//

import SwiftUI

class DoctorListViewModel: ObservableObject {
    @Published var doctors: [Doctor] = []
    @Published var filter: DoctorFilter = .priceAsc
    @Published var searchText: String = ""
    
    let networkService = NetworkService()
    
    var filteredList: [Doctor] {
        
        var filteredList = doctors
        
        if searchText != "" {
            filteredList = filteredList.filter { $0.doctorFullName.localizedStandardContains(searchText) || $0.doctorSpecializations.localizedStandardContains(searchText) }
        }
        
        switch filter {
        case .priceAsc:
            return filteredList.sorted { $0.minServicePrice < $1.minServicePrice }
        case .priceDesc:
            return filteredList.sorted { $0.minServicePrice > $1.minServicePrice }
        case .experienceAsc:
            return filteredList.sorted { $0.seniority < $1.seniority }
        case .experienceDesc:
            return filteredList.sorted { $0.seniority > $1.seniority }
        case .ratingAsc:
            return filteredList.sorted { $0.rank < $1.rank }
        case .ratingDesc:
            return filteredList.sorted { $0.rank > $1.rank }
        }
    }
    
    func getDoctorList() {
        if let doctorResponse = networkService.loadJSONFromBundle("doctor", as: DoctorsResponse.self) {
            self.doctors = doctorResponse.data.users
        }
    }
}
