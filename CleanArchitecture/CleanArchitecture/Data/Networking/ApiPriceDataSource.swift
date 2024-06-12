//
//  ApiPriceDataSource.swift
//  CleanArchitecture
//
//  Created by manueltirado on 12/6/24.
//

import Foundation

class ApiPriceDataSource: ApiPriceDataSourceType {
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getPriceHistory(id: String, days: Int) async -> Result<CryptocurrencyPriceHistoryDTO, HTTPClientError> {
        let queryParameters: [String: Any] = [
            "vs_currency" : "usd",
            "days" : days,
            "interval" : "daily"
        ]
        
        let endpoint = Endpoint(path: "coins/\(id)/market_chart",
                 queryParameters: queryParameters,
                 method: .get)
        
        let result = await httpClient.makeRequest(endpoint: endpoint, baseUrl: "https://api.coingecko.com/api/v3/")
        
        guard case .success(let data) = result else {
            return .failure(self.handleError(error: result.failureValue as? HTTPClientError))
        }
        
        guard let priceHistoryDTO = try? JSONDecoder().decode(CryptocurrencyPriceHistoryDTO.self, from: data) else {
            return .failure(.parsingError)
        }
        
        return .success(priceHistoryDTO)
    }
    
    private func handleError(error: HTTPClientError?) -> HTTPClientError {
        guard let error else {
            return .generic
        }
        return error
    }
}
