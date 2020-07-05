//
//  CovidCityApp.swift
//  Shared
//
//  Created by Romulo Messias on 04/07/20.
//

import SwiftUI

@main
struct CovidCityApp: App {
    var cityReportStore: CityReportStore = CityReportStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cityReportStore)
        }
    }
}
