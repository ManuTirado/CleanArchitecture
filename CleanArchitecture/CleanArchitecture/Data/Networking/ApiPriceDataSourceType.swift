//
//  ApiPriceDataSourceType.swift
//  CleanArchitecture
//
//  Created by manueltirado on 12/6/24.
//

import Foundation

protocol ApiPriceDataSourceType {
    func getPriceHistory(id: String, days: Int) async -> Result<CryptocurrencyPriceHistoryDTO, HTTPClientError>
}
