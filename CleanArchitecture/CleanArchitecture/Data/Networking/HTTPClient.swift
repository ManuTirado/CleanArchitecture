//
//  HTTPClient.swift
//  CleanArchitecture
//
//  Created by manueltirado on 4/6/24.
//

import Foundation

protocol HTTPClient {
    func makeRequest(endpoint: Endpoint, baseUrl: String) async -> Result<Data, HTTPClientError>
}
