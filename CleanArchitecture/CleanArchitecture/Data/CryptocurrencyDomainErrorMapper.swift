//
//  CryptocurrencyDomainErrorMapper.swift
//  CleanArchitecture
//
//  Created by manueltirado on 3/6/24.
//

import Foundation

class CryptocurrencyDomainErrorMapper {
    func map(error: HTTPClientError?) -> CryptocurrencyDomainError {
        switch error {
        case .tooManyRequests:
            return .tooManyRequests
        default:
            return .generic
        }
    }
}
