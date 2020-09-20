//
//  DataLoader.swift
//  iOS
//
//  Created by Romulo Messias on 04/07/20.
//

import Foundation

class ApiService {
    typealias Handler = (Result<CityReportGroup, NetworkError>) -> Void
    let decoder = JSONDecoder.init()
    
    func request(_ endpint: Endpoint,then handler: @escaping Handler) {
        guard let url = endpint.url else {
            return handler(.failure(.invalidUrls))
        }
        
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 60)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            
            do {
                let reportGroup = try self.decoder.decode(CityReportGroup.self, from: data!)
                DispatchQueue.main.async {
                    handler(Result.success(reportGroup))
                }
            } catch let error {
                print("error \(error)")
                DispatchQueue.main.async {
                    handler(Result.failure(NetworkError.network(error)))
                }
            }
        }
        
        task.resume()
    }
    
    enum NetworkError: Error {
        case invalidUrls
        case network(Error?)
    }
}
