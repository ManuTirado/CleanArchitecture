//
//  CryptocurrencyGlobalInfoDTO.swift
//  CleanArchitecture
//
//  Created by manueltirado on 4/6/24.
//

import Foundation

struct CryptocurrencyGlobalInfoDTO: Codable {
    let data: CryptocurrencyGlobalData
    
    struct CryptocurrencyGlobalData: Codable {
        let cryptocurrencies: [String: Double]
        
        enum CodingKeys: String, CodingKey {
            case cryptocurrencies = "market_cap_percentage"
        }
    }
}
