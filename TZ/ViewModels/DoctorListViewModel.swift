//
//  DoctorListViewModel.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 06.01.2026.
//

import SwiftUI

class DoctorListViewModel: ObservableObject {
    @Published var doctors: [Doctor] = []
    @Published var filter: DoctorFilter = .price
    
    let networkService = NetworkService()
    
    var filteredList: [Doctor] {
        switch filter {
        case .price:
            return doctors.sorted { $0.minServicePrice < $1.minServicePrice }
        case .experience:
            return doctors.sorted { $0.seniority < $1.seniority }
        case .rating:
            return doctors.sorted { $0.rank < $1.rank }
        }
    }
    
    func getDoctorList() {
        if let doctorResponse = networkService.loadJSONFromBundle("doctor", as: DoctorsResponse.self) {
            self.doctors = doctorResponse.data.users
        }
    }
}
