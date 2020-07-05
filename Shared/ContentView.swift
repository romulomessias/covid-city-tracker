//
//  ContentView.swift
//  Shared
//
//  Created by Romulo Messias on 04/07/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var cityReportStore: CityReportStore
    
    var city = "Limeira"
    
    var body: some View {
        VStack {
            if cityReportStore.isLoadingReports {
                
                Text("buscando dados de \(city)")
                
            } else {
                if let report = cityReportStore.cityReportsGroup {
                    CityReportView(report: report)
                }
                
            }
        }.onAppear {
            cityReportStore.loadReports(for: city)
        }
    }
}
