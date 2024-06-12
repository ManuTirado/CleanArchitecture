//
//  CryptocurrencyPriceHistoryRepositoryType.swift
//  CleanArchitecture
//
//  Created by manueltirado on 12/6/24.
//

import Foundation

protocol CryptocurrencyPriceHistoryRepositoryType {
    func getPriceHistory(id: String, days: Int) async -> Result<CryptocurrencyPriceHistory, CryptocurrencyDomainError>
}
