//
//  CryptoDetailViewModel.swift
//  CleanArchitecture
//
//  Created by manueltirado on 12/6/24.
//

import Foundation

class CryptoDetailViewModel: ObservableObject {
    
    @Published var dataPoints: [ChartDataPoint] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    private let getPriceHistory: GetPriceHistoryType
    private let errorMapper: CryptocurrencyPresentableErrorMapper
    
    init(getPriceHistory: GetPriceHistoryType, errorMapper: CryptocurrencyPresentableErrorMapper) {
        self.getPriceHistory = getPriceHistory
        self.errorMapper = errorMapper
    }
    
    func getDetail() {
        Task { @MainActor in
            self.errorMessage = nil
            self.isLoading = true
        }
        Task {
            let result = await getPriceHistory.execute(id: "bitcoin", days: 30)
            
            guard case .success(let priceHistory) = result else {
                self.handleError(error: result.failureValue as? CryptocurrencyDomainError)
                return
            }
            
            let dataPoints = priceHistory.prices.map { ChartDataPoint(date: $0.date, price: $0.price) }
            
            Task { @MainActor in
                self.isLoading = false
                self.dataPoints = dataPoints
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

extension CryptoDetailViewModel {
    static var preview: CryptoDetailViewModel {
        .init(getPriceHistory: GetPriceHistoryTypePreview(), errorMapper: CryptocurrencyPresentableErrorMapper())
    }
}
