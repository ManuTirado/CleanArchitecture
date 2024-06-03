//
//  CryptocurrencyDomainErrorMapper.swift
//  CleanArchitecture
//
//  Created by manueltirado on 3/6/24.
//

import Foundation

class CryptocurrencyDomainErrorMapper {
    func map(error: HTTPClientError?) -> CryptocurrencyDomainError {
        return .generic
    }
}
