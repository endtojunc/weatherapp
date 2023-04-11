//
//  Condition.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 9/4/23.
//

import Foundation

struct Condition: Codable {
    private(set) var text: String
    private(set) var icon: String
    private(set) var code: Int
}
