//
//  HTTPClientError.swift
//  CleanArchitecture
//
//  Created by manueltirado on 3/6/24.
//

import Foundation

enum HTTPClientError: Error {
    case generic
    case clientError
    case serverError
    case parsingError
    case badUrl
    case responseError
    case tooManyRequests
}
