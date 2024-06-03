//
//  ApiDataSourceType.swift
//  CleanArchitecture
//
//  Created by manueltirado on 3/6/24.
//

import Foundation

protocol ApiDataSourceType {
    func getGlobalCryptoSymbolList() async -> Result<[String], HTTPClientError>
    func getCryptoList() async -> Result<[CryptocurrencyBasicDTO], HTTPClientError>
    func getPriceInfoForCryptos(ids: [String]) async -> Result<[String: CryptocurrencyPriceInfoDTO], HTTPClientError>
}
