//
//  Hourly.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 9/4/23.
//

import Foundation

public struct Hourly: Codable {
    private(set) var timeEpoch: UInt
    private(set) var time: String
    private(set) var tempC: Float
    private(set) var tempF: Float
}
