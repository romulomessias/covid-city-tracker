//
//  CityReporterStore.swift
//  iOS
//
//  Created by Romulo Messias on 05/07/20.
//

import Foundation

class CityReportStore: ObservableObject {
    @Published private(set) var cityReportsGroup: [String:CityReportGroup] = [:]
    @Published private(set) var isLoadingReports: Bool = true
    
    let apiService = ApiService()
    
    func loadReports(for city: String) {
        let endpoint = Endpoint.search(in: city)
        isLoadingReports = true
        
        apiService.request(endpoint) { result in
            do {
                let apiResult = try result.get()
                self.cityReportsGroup[city] = apiResult
            } catch let error {
                print(error)
            }
            
            self.isLoadingReports = false
        }
    }
}
