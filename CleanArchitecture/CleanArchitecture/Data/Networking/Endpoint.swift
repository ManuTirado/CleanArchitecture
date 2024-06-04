//
//  Endpoint.swift
//  CleanArchitecture
//
//  Created by manueltirado on 4/6/24.
//

import Foundation

struct Endpoint {
    let path: String
    var queryParameters: [String: Any] = [:]
    let method: HTTPMethod
}
