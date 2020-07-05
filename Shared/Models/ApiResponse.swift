//
//  ApiResponse.swift
//  iOS
//
//  Created by Romulo Messias on 04/07/20.
//

import Foundation

// MARK: - ApiResponse
struct CityReport: Codable {
    let count: Int
    let next, previous: String?
    let results: [CityReport]
}

// MARK: - Result
struct CityReport: Codable {
    let city: String
    let cityIbgeCode: Int
    let date: String
    let epidemiologicalWeek, estimatedPopulation2019: Int
    let isLast, isRepeated: Bool
    let lastAvailableConfirmed: Int
    let lastAvailableConfirmedPer100KInhabitants: Double
    let lastAvailableDate: String
    let lastAvailableDeathRate: Double
    let lastAvailableDeaths, newConfirmed, newDeaths, orderForPlace: Int
    let placeType, state: String

    enum CodingKeys: String, CodingKey {
        case city
        case cityIbgeCode = "city_ibge_code"
        case date
        case epidemiologicalWeek = "epidemiological_week"
        case estimatedPopulation2019 = "estimated_population_2019"
        case isLast = "is_last"
        case isRepeated = "is_repeated"
        case lastAvailableConfirmed = "last_available_confirmed"
        case lastAvailableConfirmedPer100KInhabitants = "last_available_confirmed_per_100k_inhabitants"
        case lastAvailableDate = "last_available_date"
        case lastAvailableDeathRate = "last_available_death_rate"
        case lastAvailableDeaths = "last_available_deaths"
        case newConfirmed = "new_confirmed"
        case newDeaths = "new_deaths"
        case orderForPlace = "order_for_place"
        case placeType = "place_type"
        case state
    }
}
