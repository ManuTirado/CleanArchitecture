//
//  CryptocurrencyPriceHistoryDTO.swift
//  CleanArchitecture
//
//  Created by manueltirado on 12/6/24.
//

import Foundation

struct CryptocurrencyPriceHistoryDTO: Codable {
    let prices: [[Double]]
    
    enum CodingKeys: String, CodingKey {
        case prices
    }
}
