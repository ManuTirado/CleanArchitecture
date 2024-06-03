//
//  Cryptocurrency.swift
//  CleanArchitecture
//
//  Created by manueltirado on 3/6/24.
//

import Foundation

struct Cryptocurrency {
    let id: String
    let name: String
    let symbol: String
    let price: Double
    let price24h: Double?
    let volume24h: Double?
    let marketCap: Double
}
