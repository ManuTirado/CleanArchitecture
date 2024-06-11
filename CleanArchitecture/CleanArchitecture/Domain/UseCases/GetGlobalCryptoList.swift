//
//  GetGlobalCryptoList.swift
//  CleanArchitecture
//
//  Created by manueltirado on 3/6/24.
//

import Foundation

protocol GetGlobalCryptoListType {
    func execute() async -> Result<[Cryptocurrency], CryptocurrencyDomainError>
}

class GetGlobalCryptoList: GetGlobalCryptoListType {
    private let repository: GlobalCryptoListRepositoryType
    
    init(repository: GlobalCryptoListRepositoryType) {
        self.repository = repository
    }
    
    func execute() async -> Result<[Cryptocurrency], CryptocurrencyDomainError> {
        let result = await repository.getGlobalCryptoList()
        guard let cryptoList = try? result.get() else {
            guard case .failure(let error) = result else { return .failure(.generic) }
            
            return .failure(error)
        }
        
        return .success(cryptoList.sorted { $0.marketCap > $1.marketCap })
    }
}

class GetGlobalCryptoListPreview: GetGlobalCryptoListType {
    func execute() async -> Result<[Cryptocurrency], CryptocurrencyDomainError> {
        let res: [Cryptocurrency] = [
            .init(id: "btc", name: "Bitcoin", symbol: "btc", price: 66501, price24h: -4.827688476552536, volume24h: 37674262053.233635, marketCap: 1308093783807.3662),
            .init(id: "batcat", name: "batcat", symbol: "batcat", price: 0.00019985, price24h: 28.24236934712287, volume24h: -32767.413242083072, marketCap: 0.0),
            .init(id: "btc", name: "dogecoin", symbol: "btc", price: 124, price24h: 4.827688476552536, volume24h: 37674262053.233635, marketCap: 1308093783807.3662),
            .init(id: "btc", name: "ethereum", symbol: "btc", price: 1241, price24h: -4.827688476552536, volume24h: -37674262053.233635, marketCap: 1308093783807.3662)
        ]
        return .success(res)
    }
}
