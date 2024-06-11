//
//  Foundation+Extensions.swift
//  CleanArchitecture
//
//  Created by manueltirado on 3/6/24.
//

import Foundation

extension Result {
    var failureValue: Error? {
        switch self {
        case .failure(let error):
            return error
        case .success:
            return nil
        }
    }
}

extension Double {
    func toCurrency() -> Double {
        let divisor = pow(10.0, 2.0)
        return (self * divisor).rounded() / divisor
    }
}
