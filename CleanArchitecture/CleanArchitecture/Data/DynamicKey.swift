//
//  DynamicKey.swift
//  CleanArchitecture
//
//  Created by manueltirado on 11/6/24.
//

import Foundation

struct DynamicKey: CodingKey {
    var stringValue: String
    init?(stringValue: String) {
        self.stringValue = stringValue
    }

    var intValue: Int?
    init?(intValue: Int) {
        return nil
    }
}
