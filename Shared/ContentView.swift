//
//  ContentView.swift
//  Shared
//
//  Created by Romulo Messias on 04/07/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var cityReportStore: CityReportStore
    @EnvironmentObject var locationStore: LocationStore
    
//    var city = "Limeira"
    
    var body: some View {
        VStack {
            if cityReportStore.isLoadingReports {
                ProgressView {
                    Text("Atualizando dados")
                }
            } else {
                
                if
                    let city = locationStore.currentCity,
                    let report = cityReportStore.cityReportsGroup[city] {
                    CityReportView(report: report)
                    
                }
            }
        }
        .onChange(of: locationStore.currentCity) { _ in
            if let city = locationStore.currentCity {
                cityReportStore.loadReports(for: city)
            }
        }
    }
}
