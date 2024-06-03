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
