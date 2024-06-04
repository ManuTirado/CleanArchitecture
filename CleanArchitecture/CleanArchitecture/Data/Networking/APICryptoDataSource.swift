//
//  APICryptoDataSource.swift
//  CleanArchitecture
//
//  Created by manueltirado on 4/6/24.
//

import Foundation

class APICryptoDataSource: ApiDataSourceType {
    
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getGlobalCryptoSymbolList() async -> Result<[String], HTTPClientError> {
        let endpoint = Endpoint(path: "global", method: .get)
        let result = await httpClient.makeRequest(endpoint: endpoint,
                                            baseUrl: "https://api.coingecko.com/api/v3/")
        
        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }
        
        guard let symbolList = try? JSONDecoder().decode(CryptocurrencyGlobalInfoDTO.self, from: data) else { return .failure(.parsingError) }
        return .success(symbolList.data.cryptocurrencies.map({ $0.key }))
    }
    
    func getCryptoList() async -> Result<[CryptocurrencyBasicDTO], HTTPClientError> {
        let endpoint = Endpoint(path: "coins/list", method: .get)
        let result = await httpClient.makeRequest(endpoint: endpoint,
                                            baseUrl: "https://api.coingecko.com/api/v3/")
        
        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }
        
        guard let cryptoList = try? JSONDecoder().decode([CryptocurrencyBasicDTO].self, from: data) else { return .failure(.parsingError) }
        return .success(cryptoList)
    }
    
    func getPriceInfoForCryptos(ids: [String]) async -> Result<[String : CryptocurrencyPriceInfoDTO], HTTPClientError> {
        let queryParameters: [String: Any] = [
            "ids": ids.joined(separator: ","),
            "vs_currencies": "usd",
            "include_market_cap": true,
            "include_24hr_vol": true,
            "include_24hr_change": true
        ]
        let endpoint = Endpoint(path: "simple/price",
                                queryParameters: queryParameters,
                                method: .get)
        
        let result = await httpClient.makeRequest(endpoint: endpoint,
                                            baseUrl: "https://api.coingecko.com/api/v3/")
        
        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }

        guard let cryptoList = try? JSONDecoder().decode([String : CryptocurrencyPriceInfoDTO].self, from: data) else { return .failure(.parsingError) }
        return .success(cryptoList)
    }
    
    private func handleError(error: HTTPClientError?) -> HTTPClientError {
        guard let error else { return .generic }
        
        return error
    }
}
