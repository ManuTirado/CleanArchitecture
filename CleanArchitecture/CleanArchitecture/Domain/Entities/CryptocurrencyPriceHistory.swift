//
//  CryptocurrencyPriceHistory.swift
//  CleanArchitecture
//
//  Created by manueltirado on 12/6/24.
//

import Foundation

struct CryptocurrencyPriceHistory {
    let prices: [DataPoint]
    
    struct DataPoint {
        let price: Double
        let date: Date
    }
}
