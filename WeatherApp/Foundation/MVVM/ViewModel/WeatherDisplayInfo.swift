//
//  WeatherDisplayInfo.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 13/4/23.
//

import Foundation

struct WeatherDisplayInfo {
    private(set) var currentLocation: String?
    private(set) var minTemp: String?
    private(set) var maxTemp: String?
    private(set) var currentTemp: String?
    private(set) var hourlyForecast: [HourlyForecast]?
    private(set) var dailyForecast: [DailyForecast]?
}
