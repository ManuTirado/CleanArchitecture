//
//  GlobalCryptoListViewModel.swift
//  CleanArchitecture
//
//  Created by manueltirado on 4/6/24.
//

import Foundation

class GlobalCryptoListViewModel: ObservableObject {
    private let getGlobalCryptoList: GetGlobalCryptoListType
    private let errorMapper: CryptocurrencyPresentableErrorMapper
    @Published var cryptos: [CryptoListPresentableItem] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    init(getGlobalCryptoList: GetGlobalCryptoListType, errorMapper: CryptocurrencyPresentableErrorMapper) {
        self.getGlobalCryptoList = getGlobalCryptoList
        self.errorMapper = errorMapper
    }
    
    func getCryptos() {
        errorMessage = nil
        isLoading = true
        Task {
            let result = await getGlobalCryptoList.execute()
            guard case .success(let cryptos) = result else {
                self.handleError(error: result.failureValue as? CryptocurrencyDomainError)
                return
            }
            let presentableCryptos = cryptos.map({ CryptoListPresentableItem(domainModel: $0) })
            Task { @MainActor in
                isLoading = false
                self.cryptos = presentableCryptos
            }
        }
    }
    
    private func handleError(error: CryptocurrencyDomainError?) {
        Task { @MainActor in
            isLoading = false
            errorMessage = errorMapper.map(error: error)
        }
    }
}

extension GlobalCryptoListViewModel {
    static var preview: GlobalCryptoListViewModel {
        .init(getGlobalCryptoList: GetGlobalCryptoListPreview(), errorMapper: CryptocurrencyPresentableErrorMapper())
    }
}
