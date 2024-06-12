//
//  CryptoDetailFactory.swift
//  CleanArchitecture
//
//  Created by manueltirado on 12/6/24.
//

import Foundation

class CryptoDetailFactory: CreateCryptoDetailView {
    func create() -> CryptoDetailView {
        CryptoDetailView(viewModel: self.createViewModel())
    }
    
    private func createViewModel() -> CryptoDetailViewModel {
        CryptoDetailViewModel(getPriceHistory: self.createUseCase(), errorMapper: CryptocurrencyPresentableErrorMapper())
    }
    
    private func createUseCase() -> GetPriceHistoryType {
        GetPriceHistory(repository: self.createRepository())
    }
    
    private func createRepository() -> CryptocurrencyPriceHistoryRepositoryType {
        CryptocurrencyPriceRepository(apiDataSource: self.createDataSource(),
                                      domainMapper: CryptocurrencyPriceHistoryDomainMapper(),
                                      errorMapper: CryptocurrencyDomainErrorMapper())
    }
    
    private func createDataSource() -> ApiPriceDataSourceType {
        ApiPriceDataSource(httpClient: self.createHTTPClient())
    }
    
    private func createHTTPClient() -> HTTPClient {
        URLSessionHTTPClient(requestMaker: URLSessionRequestMaker(),
                             errorResolver: URLSessionErrorResolver())
    }
}
