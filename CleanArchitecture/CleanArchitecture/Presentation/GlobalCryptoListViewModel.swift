//
//  GlobalCryptoListViewModel.swift
//  CleanArchitecture
//
//  Created by manueltirado on 4/6/24.
//

import Foundation

struct CryptoListPresentableItem {
    let id: String
    let name: String
    let symbol: String
    let price: String
    let price24h: String
    let volume24h: String
    let marketCap: String
    
    init(domainModel: Cryptocurrency) {
        self.id = domainModel.id
        self.name = domainModel.name
        self.symbol = domainModel.symbol
        self.price = "\(domainModel.price) $"
        self.price24h = domainModel.price24h != nil ? "\(domainModel.price24h!) %" : "-"
        self.volume24h = domainModel.volume24h != nil ? "\(domainModel.volume24h!) $" : "-"
        self.marketCap = "\(domainModel.marketCap) $"
    }
}

class GlobalCryptoListViewModel: ObservableObject {
    private let getGlobalCryptoList: GetGlobalCryptoListType
    @Published var cryptos: [CryptoListPresentableItem] = []
    @Published var isLoading: Bool = false
    
    init(getGlobalCryptoList: GetGlobalCryptoListType) {
        self.getGlobalCryptoList = getGlobalCryptoList
    }
    
    func onAppear() {
        isLoading = true
        Task {
            let result = await getGlobalCryptoList.execute()
            let cryptocurrencies = try? result.get().map({ CryptoListPresentableItem(domainModel: $0) })
            guard let cryptocurrencies else { 
                isLoading = false
                return
            }
            
            Task { @MainActor in
                isLoading = false
                self.cryptos = cryptocurrencies
                print("cryptos: \(cryptocurrencies)")
            }
        }
    }
}
