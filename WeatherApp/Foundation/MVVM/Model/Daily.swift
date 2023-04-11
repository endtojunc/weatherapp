//
//  Daily.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 9/4/23.
//

import Foundation

struct Daily: Codable {
    private (set) var maxTempF: Float
    private (set) var maxTempC: Float
    private (set) var minTempF: Float
    private (set) var minTempC: Float
    private (set) var maxWindMph: Float
    private (set) var maxWindKph: Float
    private (set) var minWindMph: Float
    private (set) var minWindKph: Float
    private (set) var hour: [Hourly]
}
