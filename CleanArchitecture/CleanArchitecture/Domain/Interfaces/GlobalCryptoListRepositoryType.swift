//
//  GlobalCryptoListRepositoryType.swift
//  CleanArchitecture
//
//  Created by manueltirado on 3/6/24.
//

import Foundation

protocol GlobalCryptoListRepositoryType {
    func getGlobalCryptoList() async -> Result<[Cryptocurrency], CryptocurrencyDomainError>
}
