//
//  CityReportView.swift
//  iOS
//
//  Created by Romulo Messias on 05/07/20.
//

import SwiftUI

struct CityReportView: View {
    var report: CityReportGroup
    
    var cityName: String {
        report.lastReport?.city ?? ""
    }
    
    var lastUpdated: String? {
        guard let lastReport = report.lastReport else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        
        if let date = dateFormatter.date(from: lastReport.date) {
            print(date)
            print(lastReport.date)
            dateFormatter.dateFormat = "d MMMM yyyy"
            return dateFormatter.string(from: date)
        } else  {
            return nil
        }
    }
    
    
    var numberOfCases: Int? {
        guard let lastReport = report.lastReport else {
            return nil
        }
        
        return lastReport.lastAvailableConfirmed
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading)  {
                Text(cityName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red:0.01, green:0.25, blue:0.4))
                
                if let lastUpdated = self.lastUpdated {
                    Text("Ultima atualização em \(lastUpdated)")
                        .font(.caption)
                        .fontWeight(.regular)
                }
                
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .clipped()
            
            VStack(spacing: 8) {
                if let numberOfCases = report.lastReport?.lastAvailableConfirmed,
                   let newCases = report.lastReport?.newConfirmed{
                    VStack(alignment: .center) {
                        Text("Casos confirmados")
                            .foregroundColor(Color(red:0.01, green:0.25, blue:0.4))
                        Text("\(numberOfCases)")
                            .font(.system(size: 60))
                            .fontWeight(.bold)
                            .foregroundColor(Color(red:0.01, green:0.25, blue:0.4))
                            .multilineTextAlignment(.center)
                        
                        Text("+\(newCases)")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red:0.01, green:0.25, blue:0.4))
                            .multilineTextAlignment(.center)
                    }
                    .padding(.vertical, 32.0)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color(red:0.91, green:0.93, blue:0.94))
                    .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 0.5)
                }
                
                if let numberOfDeaths = report.lastReport?.lastAvailableDeaths,
                   let newDeaths = report.lastReport?.newDeaths{
                    VStack(alignment: .center) {
                        Text("Óbitos")
                        Text("\(numberOfDeaths)")
                            .font(.system(size: 60))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                        Text("+\(newDeaths)")
                            .font(.headline)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                    }
                    .foregroundColor(Color(red:1, green:0, blue:0.29))
                    .padding(.vertical, 32.0)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color(red:1, green:0.7, blue:0.78))
                    .cornerRadius(10.0)
                    .shadow(radius: 0.5)
                }
            }
            .padding(.all, 10)
            Spacer()
        }
    }
}

struct CityReportView_Previews: PreviewProvider {
    static var previews: some View {
        let reportGroup: CityReportGroup
        let report = CityReport(city: "Limeira",
                                cityIbgeCode: 3526902,
                                date: "2020-07-03",
                                epidemiologicalWeek: 27,
                                estimatedPopulation2019: 306114,
                                isLast: true,
                                isRepeated: false,
                                lastAvailableConfirmed: 1068,
                                lastAvailableConfirmedPer100KInhabitants: 348.88963,
                                lastAvailableDate: "2020-07-03",
                                lastAvailableDeathRate: 0.0384,
                                lastAvailableDeaths: 41,
                                newConfirmed: 63,
                                newDeaths: 4,
                                orderForPlace: 94,
                                placeType:"city",
                                state: "SP"
        )
        
        reportGroup = CityReportGroup(count: 1, next: nil, previous: nil, results: [report])
        return Group {
            CityReportView(report: reportGroup)
            CityReportView(report: reportGroup)
                .preferredColorScheme(.dark)
        }
    }
}
