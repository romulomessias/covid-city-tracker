//
//  DataLoader.swift
//  iOS
//
//  Created by Romulo Messias on 04/07/20.
//

import Foundation
import Network


class ApiService {
    func request(_ endpint: Endpoint,then handler: @escaping (Result<Data, NetworkError>) -> Void ) {
        guard let url = endpint.url else {
            return handler(.failure(.invalidUrls))
        }
    }
    
    enum NetworkError: Error {
        case invalidUrls
    }
}
