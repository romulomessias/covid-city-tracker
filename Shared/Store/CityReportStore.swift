//
//  CityReporterStore.swift
//  iOS
//
//  Created by Romulo Messias on 05/07/20.
//

import Foundation

class CityReportStore: ObservableObject {
    @Published var cityReports: [CityReport] = []
}
