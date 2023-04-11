//
//  ForecastDay.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 9/4/23.
//

import Foundation

public struct ForecastDay: Codable {
    private(set) var date: String
    private(set) var dateEpoch: UInt
    private(set) var daily: Daily
}
