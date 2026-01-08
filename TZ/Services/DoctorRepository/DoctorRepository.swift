//
//  DoctorRepository.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 07.01.2026.
//

import Foundation

final class DoctorRepository: DoctorRepositoryProtocol {
    private let dataSource: NetworkServiceProtocol
    private let fileName: String

    init(
        dataSource: NetworkServiceProtocol = NetworkService(),
        fileName: String = "doctor"
    ) {
        self.dataSource = dataSource
        self.fileName = fileName
    }

    func fetchDoctors() -> [Doctor] {
        guard let response = dataSource.loadJSONFromBundle(fileName, as: DoctorsResponse.self) else {
            return []
        }
        return response.data.users
    }
}
