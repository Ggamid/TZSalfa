//
//  DoctorListViewModel.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 06.01.2026.
//

import SwiftUI

@Observable
final class DoctorListViewModel {
    private(set) var doctors: [Doctor] = []
    var filter: DoctorFilter = .priceAsc
    var searchText: String = ""
    
    private let repository: DoctorRepositoryProtocol
    
    init(repository: DoctorRepositoryProtocol = DoctorRepository()) {
        self.repository = repository
    }
    
    var filteredList: [Doctor] {
        let searched = applySearch(on: doctors)
        return sort(searched, by: filter)
    }
    
    func loadDoctors() {
        doctors = repository.fetchDoctors()
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
