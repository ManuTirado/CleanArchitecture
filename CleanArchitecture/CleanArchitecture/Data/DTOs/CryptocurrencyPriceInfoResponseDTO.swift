//
//  CryptocurrencyPriceInfoResponseDTO.swift
//  CleanArchitecture
//
//  Created by manueltirado on 11/6/24.
//

import Foundation

struct CryptocurrencyPriceInfoResponseDTO: Codable {
    let cryptos: [String : CryptocurrencyPriceInfoDTO]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicKey.self)
        var cryptos = [String: CryptocurrencyPriceInfoDTO]()
        for key in container.allKeys {
            let priceData = try container.decode(CryptocurrencyPriceInfoDTO.self, forKey: key)
            cryptos[key.stringValue] = priceData
        }
        self.cryptos = cryptos
    }
    
    enum CodingKeys: String, CodingKey {
        case cryptos = "self"
    }
}
