//
//  Endpoint.swift
//  iOS
//
//  Created by Romulo Messias on 04/07/20.
//

import Foundation

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
}


extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "brasil.io"
        components.path = path
        components.queryItems = queryItems
        
        return components.url
    }
    
    static func search(in city: String) -> Endpoint  {
        return Endpoint(
            path: "/api/dataset/covid19/caso_full/data/",
            queryItems: [
                URLQueryItem(name: "format", value: "json"),
                URLQueryItem(name: "city", value: city),
                URLQueryItem(name: "is_last", value: "true"),
            ]
        )
    }
}
