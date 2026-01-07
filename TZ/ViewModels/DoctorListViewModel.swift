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
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    var filteredList: [Doctor] {
        let searched = applySearch(on: doctors)
        return sort(searched, by: filter)
    }
    
    func getDoctorList() {
        if let doctorResponse = networkService.loadJSONFromBundle("doctor", as: DoctorsResponse.self) {
            self.doctors = doctorResponse.data.users
        }
    }
}

private extension DoctorListViewModel {
    var trimmedQuery: String {
        searchText.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func applySearch(on list: [Doctor]) -> [Doctor] {
        guard !trimmedQuery.isEmpty else { return list }
        return list.filter {
            $0.doctorFullName.localizedStandardContains(trimmedQuery) ||
            $0.doctorSpecializations.localizedStandardContains(trimmedQuery)
        }
    }
    
    func sort(_ list: [Doctor], by filter: DoctorFilter) -> [Doctor] {
        switch filter {
        case .priceAsc:
            return list.sorted { $0.minServicePrice < $1.minServicePrice }
        case .priceDesc:
            return list.sorted { $0.minServicePrice > $1.minServicePrice }
        case .experienceAsc:
            return list.sorted { $0.seniority < $1.seniority }
        case .experienceDesc:
            return list.sorted { $0.seniority > $1.seniority }
        case .ratingAsc:
            return list.sorted { $0.rank < $1.rank }
        case .ratingDesc:
            return list.sorted { $0.rank > $1.rank }
        }
    }
}
