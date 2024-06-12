//
//  GetPriceHistory.swift
//  CleanArchitecture
//
//  Created by manueltirado on 12/6/24.
//

import Foundation

protocol GetPriceHistoryType {
    func execute(id: String, days: Int) async -> Result<CryptocurrencyPriceHistory, CryptocurrencyDomainError>
}

class GetPriceHistory: GetPriceHistoryType {
    private let repository: CryptocurrencyPriceHistoryRepositoryType
    
    init(repository: CryptocurrencyPriceHistoryRepositoryType) {
        self.repository = repository
    }
    
    func execute(id: String, days: Int) async -> Result<CryptocurrencyPriceHistory, CryptocurrencyDomainError> {
        await repository.getPriceHistory(id: id, days: days)
    }
}

class GetPriceHistoryTypePreview: GetPriceHistoryType {
    func execute(id: String, days: Int) async -> Result<CryptocurrencyPriceHistory, CryptocurrencyDomainError> {
        let calendar = Calendar.current
        let date = Date()
        let res = CryptocurrencyPriceHistory(prices: [
            .init(price: 1414141441, date: date),
            .init(price: 215125, date: calendar.date(byAdding: .day, value: 1, to: date) ?? date),
            .init(price: 121212, date: calendar.date(byAdding: .day, value: 2, to: date) ?? date),
            .init(price: 215125215, date: calendar.date(byAdding: .day, value: 3, to: date) ?? date),
            .init(price: 12512512521521, date: calendar.date(byAdding: .day, value: 4, to: date) ?? date),
            .init(price: 12512521512521521512, date: calendar.date(byAdding: .day, value: 5, to: date) ?? date),
            .init(price: 12215412, date: calendar.date(byAdding: .day, value: 6, to: date) ?? date)
        ])
        return .success(res)
    }
}
