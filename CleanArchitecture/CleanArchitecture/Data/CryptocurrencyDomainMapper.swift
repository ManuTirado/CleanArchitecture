//
//  CryptocurrencyDomainMapper.swift
//  CleanArchitecture
//
//  Created by manueltirado on 3/6/24.
//

import Foundation

class CryptocurrencyDomainMapper {
    
    func getCryptoCurrencyBuilderList(symbolList: [String], cryptoList: [CryptocurrencyBasicDTO]) -> [CryptocurrencyBuilder] {
        var symbolListDic = [String: Bool]()
        symbolList.forEach { symbol in
            symbolListDic[symbol] = true
        }
        
        let globalCryptoList = cryptoList.filter {symbolListDic[$0.symbol] ?? false }
        
        let cryptocurrencyBuilderList = globalCryptoList.map { CryptocurrencyBuilder(id: $0.id, name: $0.name, symbol: $0.symbol) }
        
        return cryptocurrencyBuilderList
    }
    
    func map(cryptocurrencyBuilderList: [CryptocurrencyBuilder], priceInfo: [String: CryptocurrencyPriceInfoDTO]) -> [Cryptocurrency] {
        cryptocurrencyBuilderList.forEach { builder in
            if let priceInfo = priceInfo[builder.id] {
                builder.price = priceInfo.price
                builder.price24h = priceInfo.price24h
                builder.volume24h = priceInfo.volume24h
                builder.marketCap = priceInfo.marketCap
            }
        }
        
        return cryptocurrencyBuilderList.compactMap({ $0.build() })
    }
}
