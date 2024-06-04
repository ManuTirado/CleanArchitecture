//
//  URLSessionErrorResolver.swift
//  CleanArchitecture
//
//  Created by manueltirado on 4/6/24.
//

import Foundation

class URLSessionErrorResolver {
    func resolve(statusCode: Int) -> HTTPClientError {
        guard statusCode != 429 else {
            return .tooManyRequests
        }
        
        guard statusCode < 500  else {
            return .clientError
        }
        
        return .serverError
    }
    
    func resolve(error: Error) -> HTTPClientError {
        return .generic
    }
}
