//
//  Current.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 9/4/23.
//

import Foundation

struct Current: Codable {
    private(set) var tempC: String
    private(set) var tempF: String
    private(set) var condition: Condition
}
