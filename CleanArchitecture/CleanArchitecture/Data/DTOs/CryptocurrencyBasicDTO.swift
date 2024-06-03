//
//  CryptocurrencyBasicDTO.swift
//  CleanArchitecture
//
//  Created by manueltirado on 3/6/24.
//

import Foundation

struct CryptocurrencyBasicDTO: Codable {
    let id: String
    let symbol: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name
    }
}
