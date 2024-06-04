//
//  GlobalCryptoListFactory.swift
//  CleanArchitecture
//
//  Created by manueltirado on 4/6/24.
//

import Foundation

class GlobalCryptoListFactory {
    static func create() -> GlobalCryptoListView {
        return GlobalCryptoListView(viewModel: self.createViewModel())
    }
    
    private static func createViewModel() -> GlobalCryptoListViewModel {
        return GlobalCryptoListViewModel(getGlobalCryptoList: self.createUseCase())
    }
    
    private static func createUseCase() -> GetGlobalCryptoListType {
        return GetGlobalCryptoList(repository: self.createRepository())
    }
    
    private static func createRepository() -> GlobalCryptoListRepositoryType {
        return CryptocurrencyRepository(apiDatasource: self.createDataSource(),
                                        errorMapper: CryptocurrencyDomainErrorMapper(),
                                        domainMapper: CryptocurrencyDomainMapper())
    }
    
    private static func createDataSource() -> ApiDataSourceType {
        let httpClient = URLSessionHTTPClient(requestMaker: URLSessionRequestMaker(),
                                              errorResolver: URLSessionErrorResolver())
        return APICryptoDataSource(httpClient: httpClient)
    }
}
