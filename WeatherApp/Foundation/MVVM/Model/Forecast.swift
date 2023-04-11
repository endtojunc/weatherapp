//
//  Forecast.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 9/4/23.
//

import Foundation

struct Forecast: Codable {
    private(set) var forecastDays: [Daily]
}
