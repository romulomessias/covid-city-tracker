//
//  CityReporterStore.swift
//  iOS
//
//  Created by Romulo Messias on 05/07/20.
//

import Foundation

class CityReportStore: ObservableObject {
    @Published private(set) var cityReportsGroup: CityReportGroup?
    @Published private(set) var isLoadingReports: Bool = true
    
    let apiService = ApiService()
    
    func loadReports(for city: String) {
        let endpoint = Endpoint.search(in: city)
        isLoadingReports = true
        print("Loadinf")
        apiService.request(endpoint) { result in
            do {
                let apiResult = try result.get()
                self.cityReportsGroup = apiResult
            } catch let error {
                print(error)
            }
            
            print("loaded")
            self.isLoadingReports = false
        }
    }
}
