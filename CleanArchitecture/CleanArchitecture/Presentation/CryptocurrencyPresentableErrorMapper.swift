//
//  CryptocurrencyPresentableErrorMapper.swift
//  CleanArchitecture
//
//  Created by manueltirado on 11/6/24.
//

import Foundation

class CryptocurrencyPresentableErrorMapper {
    func map(error: CryptocurrencyDomainError?) -> String {
        return switch error {
        case .tooManyRequests:
            "You have exceeded the requests limit. Try again later"
        default:
            "Something went wrong. Try again later"
        }
    }
}
