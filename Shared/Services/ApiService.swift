//
//  DataLoader.swift
//  iOS
//
//  Created by Romulo Messias on 04/07/20.
//

import Foundation

class ApiService {
    func request(_ endpint: Endpoint,then handler: @escaping (Result<CityReportGroup, NetworkError>) -> Void ) {
        guard let url = endpint.url else {
            return handler(.failure(.invalidUrls))
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            do {
                let decoder = JSONDecoder.init()
                print("hello")
                let reportGroup = try decoder.decode(CityReportGroup.self, from: data!)
                print("hello2")
                DispatchQueue.main.async {
                    print("hello3")
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
