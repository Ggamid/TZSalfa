//
//  DoctorListViewModel.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 06.01.2026.
//

import SwiftUI

class DoctorListViewModel: ObservableObject {
    @Published var doctors: [Doctor] = []
    let networkService = NetworkService()
    
    func getDoctorList() {
        if let doctorResponse = networkService.loadJSONFromBundle("doctor", as: DoctorsResponse.self) {
            self.doctors = doctorResponse.data.users
        }
    }
}
