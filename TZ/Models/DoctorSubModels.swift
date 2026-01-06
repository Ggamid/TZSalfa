//
//  DoctorSubModels.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 06.01.2026.
//

import Foundation

struct Specialization: Decodable {
    let id: Int
    let name: String
    let isModerated: Bool
}

struct EducationType: Decodable {
    let id: Int
    let name: String
}

struct HigherEducation: Decodable {
    let id: Int
    let university: String
}

struct WorkExperience: Decodable {
    let id: Int
    let organization: String
}
