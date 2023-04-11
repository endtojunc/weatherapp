//
//  Weather.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 9/4/23.
//

import Foundation

struct Weather: Codable {
    private(set) var location: Location
    private(set) var current: Current
    private(set) var forecast: Forecast
}
