//
//  NetworkService.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 06.01.2026.
//

import Foundation

protocol NetworkServiceProtocol {
    func loadJSONFromBundle<T: Decodable>(_ filename: String, as type: T.Type) -> T?
}
